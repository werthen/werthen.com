#!/usr/bin/env ruby
# frozen_string_literal: true

# Builds the PDF CV from the same sources as the /cv/ web page.
#
#   ruby _cv/build.rb          generate _cv/build/cv.tex, compile it and copy
#                              the PDF to files/lorin-werthen-brabants-cv.pdf
#   ruby _cv/build.rb --check  exit 1 if that PDF was not built from the
#                              current sources (used by the pre-commit hook)
#
# Sources: _data/cv.yml (content), _config.yml (author header),
# _publications/*.md (full publication list) and _cv/cv.tex.erb (layout).

require 'yaml'
require 'erb'
require 'date'
require 'digest'
require 'fileutils'

Encoding.default_external = Encoding::UTF_8

ROOT      = File.expand_path('..', __dir__)
CV_DIR    = File.join(ROOT, '_cv')
BUILD_DIR = File.join(CV_DIR, 'build')
TEMPLATE  = File.join(CV_DIR, 'cv.tex.erb')
PHOTO     = File.join(CV_DIR, 'photo.jpg')
DATA      = File.join(ROOT, '_data', 'cv.yml')
CONFIG    = File.join(ROOT, '_config.yml')
PUB_GLOB  = File.join(ROOT, '_publications', '*.md')
PDF_OUT   = File.join(ROOT, 'files', 'lorin-werthen-brabants-cv.pdf')

OWN_NAME    = 'Lorin Werthen-Brabants'
MAX_AUTHORS = 6 # longer author lists are cut to the first 3 + "et al."

# ---------------------------------------------------------------- text → TeX

TEX_ESCAPES = {
  '\\' => '\textbackslash{}', '{' => '\{', '}' => '\}', '$' => '\$',
  '&' => '\&', '%' => '\%', '#' => '\#', '_' => '\_',
  '~' => '\textasciitilde{}', '^' => '\textasciicircum{}'
}.freeze

def escape(str)
  str.gsub(/[\\{}$&%#_~^]/) { |c| TEX_ESCAPES[c] }
end

def url(str)
  str.to_s.gsub(/[%#]/) { |c| "\\#{c}" }
end

# Converts the Markdown subset used in _data/cv.yml to LaTeX.
def tex(str)
  return '' if str.nil?

  parts = str.to_s.split(/(\[[^\]]+\]\([^)]+\))/)
  parts.map do |part|
    if (m = part.match(/\A\[([^\]]+)\]\(([^)]+)\)\z/))
      "\\href{#{url(m[2])}}{#{inline(m[1])}}"
    else
      inline(part)
    end
  end.join
end

def inline(str)
  s = escape(str)
  s = s.gsub(/\*\*(.+?)\*\*/, '\textbf{\1}')
  s = s.gsub(/\*(.+?)\*/, '\textit{\1}')
  s = s.gsub(/"(.+?)"/, "``\\1''")
  s.gsub('—', '---').gsub('–', '--').gsub('×', '$\times$').gsub('·', '\textperiodcentered{}')
end

# ------------------------------------------------------------ publications

def front_matter(path)
  YAML.safe_load(File.read(path)[/\A---\s*\n(.*?)\n---/m, 1], permitted_classes: [Date])
end

def publication_entry(fm)
  authors = fm['authors'].to_s.split(/\s*,\s*/)
  shown = authors.length > MAX_AUTHORS ? authors.first(3) : authors
  names = shown.map { |a| a == OWN_NAME ? "\\textbf{#{escape(a)}}" : escape(a) }
  names << 'et al.' if shown.length < authors.length
  title = fm['title'].to_s.strip
  title += '.' unless title.end_with?('.', '?', '!')
  venue = fm['venue'].to_s.strip.sub(/\Athe proceedings of /i, 'Proceedings of ')
  "#{names.join(', ')} (#{fm['date'].year}). ``#{inline(title)}'' \\textit{#{escape(venue)}}."
end

def publications
  Dir[PUB_GLOB].map { |f| front_matter(f) }
               .sort_by { |fm| fm['date'] }.reverse
               .map { |fm| publication_entry(fm) }
end

# ------------------------------------------------------------------ build

def source_hash
  files = [TEMPLATE, DATA, CONFIG, PHOTO, __FILE__] + Dir[PUB_GLOB].sort
  Digest::SHA256.hexdigest(files.map { |f| File.binread(f) }.join("\0"))[0, 16]
end

def render
  config = YAML.safe_load(File.read(CONFIG), permitted_classes: [Date])
  b = binding
  b.local_variable_set(:cv, YAML.safe_load(File.read(DATA)))
  b.local_variable_set(:author, config['author'])
  b.local_variable_set(:site_url, config['url'].to_s.sub(%r{/\z}, ''))
  b.local_variable_set(:publications, publications)
  b.local_variable_set(:source_hash, source_hash)
  ERB.new(File.read(TEMPLATE), trim_mode: '<>').result(b)
end

def pdf_current?
  return false unless File.exist?(PDF_OUT)

  marker = "cv-source:#{source_hash}"
  # hyperref may write the Subject as a UTF-16BE string with octal escapes.
  utf16 = '\\376\\377' + marker.chars.map { |c| "\\000#{c}" }.join
  pdf = File.binread(PDF_OUT)
  pdf.include?(marker) || pdf.include?(utf16)
end

if ARGV.include?('--check')
  exit 0 if pdf_current?
  warn 'The PDF CV is out of date with _data/cv.yml, _publications/ or _cv/.'
  warn 'Run `ruby _cv/build.rb` and stage files/lorin-werthen-brabants-cv.pdf.'
  exit 1
end

FileUtils.mkdir_p(BUILD_DIR)
File.write(File.join(BUILD_DIR, 'cv.tex'), render)
FileUtils.cp(PHOTO, BUILD_DIR)
Dir.chdir(BUILD_DIR) do
  ok = system('latexmk', '-pdf', '-interaction=nonstopmode', '-halt-on-error', 'cv.tex',
              out: File::NULL)
  abort "LaTeX failed; see #{File.join(BUILD_DIR, 'cv.log')}" unless ok
end
FileUtils.cp(File.join(BUILD_DIR, 'cv.pdf'), PDF_OUT)
abort 'Built PDF does not carry the source hash (check \\hypersetup in cv.tex.erb).' unless pdf_current?
puts "Wrote #{PDF_OUT.sub("#{ROOT}/", '')}"
