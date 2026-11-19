---
layout: archive
title: "Curriculum Vitae"
section_label: "About me"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% comment %}
  All CV content lives in _data/cv.yml, which also generates the PDF
  (ruby _cv/build.rb). Edit the data file, not this page.
{% endcomment %}

{% include base_path %}
{% assign cv = site.data.cv %}

<div class="cv-layout">
  <header class="cv-header">
    <div class="cv-header-top">
      <img class="cv-avatar" src="{{ site.author.avatar | prepend: '/images/' | prepend: base_path }}" alt="{{ site.author.name }}">
      <div class="cv-header-text">
        <h2 class="cv-name">{{ site.author.name }}</h2>
        <p class="cv-role">{{ site.author.bio }}</p>
      </div>
    </div>
    <div class="cv-contact-inline">
      <span><i class="fa-solid fa-building-columns" aria-hidden="true"></i> {{ site.author.employer }}</span>
      <span><i class="fa-solid fa-location-dot" aria-hidden="true"></i> {{ site.author.location }}</span>
      <span><i class="fa-solid fa-envelope" aria-hidden="true"></i> <a href="mailto:{{ site.author.email }}">{{ site.author.email }}</a></span>
    </div>
    <nav class="cv-links" aria-label="Academic profiles">
      <a href="{{ site.author.googlescholar }}">Google Scholar</a>
      <a href="{{ site.author.orcid }}">ORCID</a>
      <a href="{{ base_path }}/publications/">Publications</a>
      <a href="{{ base_path }}/files/lorin-werthen-brabants-cv.pdf"><i class="fa-solid fa-file-pdf" aria-hidden="true"></i> Download PDF</a>
    </nav>
  </header>

  <div class="cv-grid">
    <section class="cv-section cv-section--summary">
      <p class="cv-tagline">{{ cv.tagline | markdownify | remove: '<p>' | remove: '</p>' | strip }}</p>
    </section>

    <section class="cv-section cv-section--publications">
      <h2><i class="fa-solid fa-book-open" aria-hidden="true"></i> Selected Publications</h2>
      <ol class="cv-publications">
        {%- for pub in cv.selected_publications %}
        <li>{{ pub | markdownify | remove: '<p>' | remove: '</p>' | strip }}</li>
        {%- endfor %}
      </ol>
    </section>

    {%- assign timelines = "experience|Professional Experience|fa-briefcase,education|Education|fa-graduation-cap" | split: "," %}
    {%- for tl in timelines %}
    {%- assign tl_parts = tl | split: "|" %}
    {%- assign tl_key = tl_parts[0] %}

    <section class="cv-section cv-section--{{ tl_key }}">
      <h2><i class="fa-solid {{ tl_parts[2] }}" aria-hidden="true"></i> {{ tl_parts[1] }}</h2>
      <div class="cv-timeline">
        {%- for item in cv[tl_key] %}
        <article class="cv-timeline-item">
          <p class="cv-date">{{ item.dates }}</p>
          <div class="cv-item-body">
            <h3>{{ item.title }}</h3>
            <p>{% if tl_key == "education" %}<em>{{ item.org }}</em>{% else %}{{ item.org | xml_escape }}{% endif %}</p>
            {%- for line in item.lines %}
            <p>{{ line | markdownify | remove: '<p>' | remove: '</p>' | strip }}</p>
            {%- endfor %}
          </div>
        </article>
        {%- endfor %}
      </div>
    </section>
    {%- endfor %}

    {%- for section in cv.sections %}

    <section class="cv-section cv-section--{{ section.id }}">
      <h2><i class="fa-solid {{ section.icon }}" aria-hidden="true"></i> {{ section.title }}</h2>
      <div class="cv-band">
        {%- for row in section.rows %}
        <article class="cv-row">
          <h3 class="cv-row-title">{{ row.title }}</h3>
          {%- if row.text %}
          <p class="cv-row-text">{{ row.text | markdownify | remove: '<p>' | remove: '</p>' | strip }}</p>
          {%- endif %}
          {%- if row.list %}
          <ul class="cv-row-text">
            {%- for li in row.list %}
            <li>{{ li | markdownify | remove: '<p>' | remove: '</p>' | strip }}</li>
            {%- endfor %}
          </ul>
          {%- endif %}
        </article>
        {%- endfor %}
      </div>
    </section>
    {%- endfor %}

    <section class="cv-section cv-section--interests">
      <h2><i class="fa-solid fa-lightbulb" aria-hidden="true"></i> Research Interests</h2>
      <p class="cv-tagline">{{ cv.research_interests | join: " · " }}</p>
    </section>

    <section class="cv-section cv-section--skills">
      <h2><i class="fa-solid fa-screwdriver-wrench" aria-hidden="true"></i> Skills</h2>
      <div class="cv-band">
        {%- for group in cv.skills %}
        <article class="cv-row">
          <h3 class="cv-row-title">{{ group.title }}</h3>
          {%- if group.style == "pills" %}
          <div class="cv-inline-meta">
            {%- for s in group.items %}
            <span class="cv-pill">{{ s.name }}</span>
            {%- endfor %}
          </div>
          {%- elsif group.items[0].icon %}
          <div class="cv-skill-list">
            {%- for s in group.items %}
            <span class="cv-skill"><i class="{{ s.icon }}" aria-hidden="true"></i> {{ s.name }}</span>
            {%- endfor %}
          </div>
          {%- else %}
          <p class="cv-row-text">{{ group.items | map: "name" | join: ", " }}.</p>
          {%- endif %}
        </article>
        {%- endfor %}
      </div>
    </section>
  </div>
</div>
