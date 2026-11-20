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

<div class="cv">
  <header class="cv-hero">
    <img class="cv-avatar" src="{{ site.author.avatar | prepend: '/images/' | prepend: base_path }}" alt="{{ site.author.name }}">
    <div class="cv-hero-text">
      <h2 class="cv-name">{{ site.author.name }}</h2>
      <p class="cv-role">{{ site.author.bio }}</p>
      <ul class="cv-contact">
        <li>{{ site.author.employer }}</li>
        <li>{{ site.author.location }}</li>
        <li><a href="mailto:{{ site.author.email }}">{{ site.author.email }}</a></li>
      </ul>
    </div>
    <nav class="cv-actions" aria-label="CV links">
      <a class="cv-btn" href="{{ base_path }}/files/lorin-werthen-brabants-cv.pdf">Download PDF <span aria-hidden="true">↓</span></a>
      <div class="cv-actions-links">
        <a href="{{ site.author.googlescholar }}">Google Scholar</a>
        <a href="{{ site.author.orcid }}">ORCID</a>
        <a href="{{ base_path }}/publications/">All publications</a>
      </div>
    </nav>
  </header>

  <div class="cv-intro">
    <p class="cv-lead">{{ cv.tagline | markdownify | remove: '<p>' | remove: '</p>' | strip }}</p>
    <div class="cv-interests">
      <span class="cv-interests-label">Research interests</span>
      <ul>
        {%- for interest in cv.research_interests %}
        <li>{{ interest }}</li>
        {%- endfor %}
      </ul>
    </div>
  </div>

  {%- assign n = 0 %}

  {%- assign n = n | plus: 1 %}
  <section class="cv-sec cv-sec--publications" id="cv-publications">
    <div class="cv-sec-head"><span class="cv-sec-num">{% if n < 10 %}0{% endif %}{{ n }}</span><h2>Selected Publications</h2></div>
    <div class="cv-sec-body">
      <ol class="cv-pubs">
        {%- for pub in cv.selected_publications %}
        <li>{{ pub | markdownify | remove: '<p>' | remove: '</p>' | strip }}</li>
        {%- endfor %}
      </ol>
      <a class="cv-more" href="{{ base_path }}/publications/">See all publications →</a>
    </div>
  </section>

  {%- assign timelines = "experience|Professional Experience,education|Education" | split: "," %}
  {%- for tl in timelines %}
  {%- assign tl_parts = tl | split: "|" %}
  {%- assign tl_key = tl_parts[0] %}
  {%- assign n = n | plus: 1 %}

  <section class="cv-sec cv-sec--{{ tl_key }}" id="cv-{{ tl_key }}">
    <div class="cv-sec-head"><span class="cv-sec-num">{% if n < 10 %}0{% endif %}{{ n }}</span><h2>{{ tl_parts[1] }}</h2></div>
    <div class="cv-sec-body">
      <ol class="cv-timeline">
        {%- for item in cv[tl_key] %}
        <li class="cv-tl-item{% if forloop.first and tl_key == 'experience' %} is-current{% endif %}">
          <p class="cv-date">{{ item.dates }}{% if forloop.first and tl_key == 'experience' %}<span class="cv-badge">Current</span>{% endif %}</p>
          <h3>{{ item.title }}</h3>
          <p class="cv-org">{{ item.org | xml_escape }}</p>
          {%- for line in item.lines %}
          <p class="cv-desc">{{ line | markdownify | remove: '<p>' | remove: '</p>' | strip }}</p>
          {%- endfor %}
        </li>
        {%- endfor %}
      </ol>
    </div>
  </section>
  {%- endfor %}

  {%- for section in cv.sections %}
  {%- assign n = n | plus: 1 %}

  <section class="cv-sec cv-sec--{{ section.id }}" id="cv-{{ section.id }}">
    <div class="cv-sec-head"><span class="cv-sec-num">{% if n < 10 %}0{% endif %}{{ n }}</span><h2>{{ section.title }}</h2></div>
    <div class="cv-sec-body cv-rows">
      {%- for row in section.rows %}
      <article class="cv-row{% if row.list %} has-list{% endif %}">
        <h3 class="cv-row-title">{{ row.title }}</h3>
        {%- if row.text %}
        <p class="cv-row-text">{{ row.text | markdownify | remove: '<p>' | remove: '</p>' | strip }}</p>
        {%- endif %}
        {%- if row.list %}
        <ul class="cv-row-list">
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

  {%- assign n = n | plus: 1 %}
  <section class="cv-sec cv-sec--skills" id="cv-skills">
    <div class="cv-sec-head"><span class="cv-sec-num">{% if n < 10 %}0{% endif %}{{ n }}</span><h2>Skills</h2></div>
    <div class="cv-sec-body cv-skills">
      {%- for group in cv.skills %}
      <div class="cv-skill-group">
        <h3>{{ group.title }}</h3>
        <ul class="cv-tags{% if group.style == 'pills' %} cv-tags--plain{% endif %}">
          {%- for s in group.items %}
          <li>{{ s.name }}</li>
          {%- endfor %}
        </ul>
      </div>
      {%- endfor %}
    </div>
  </section>
</div>
