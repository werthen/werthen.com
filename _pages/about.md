---
permalink: /
title: "About me"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

{% assign pubs_sorted = site.publications | sort: "date" | reverse %}
{% assign pubs_recent = pubs_sorted | slice: 0, 3 %}
{% assign excluded_venues = "medRxiv" | split: "|" %}

<div class="home-hero">
  <p class="home-lead">
    I am a postdoctoral researcher in Trustworthy Machine Learning (TML), focused on healthcare applications and reliable real-world deployment.
  </p>

<div class="home-tags">
    <span class="home-tag"><i class="fas fa-shield-halved" aria-hidden="true"></i> Trustworthy ML</span>
    <span class="home-tag"><i class="fas fa-heart-pulse" aria-hidden="true"></i> Healthcare AI</span>
    <span class="home-tag"><i class="fas fa-chart-line" aria-hidden="true"></i> Uncertainty Quantification</span>
    <span class="home-tags-break" aria-hidden="true"></span>
    <span class="home-tag"><i class="fas fa-brain" aria-hidden="true"></i> Deep Learning</span>
    <span class="home-tag"><i class="fas fa-wave-square" aria-hidden="true"></i> Time-Series</span>
  </div>

  <p class="home-bio">
    I earned my PhD in Computer Science from Ghent University (2023), where my dissertation centered on uncertainty quantification and robust deep learning for time-series problems. My current work advances trustworthy methods for diagnostics and patient monitoring.
  </p>
</div>

<section class="home-recent" aria-label="Recent papers">
  <h2><i class="fas fa-scroll" aria-hidden="true"></i> Recent papers</h2>
  <ul class="home-recent-list pub-year-items">
    {% for post in pubs_recent %}
      <li>
        <article class="home-paper-main pub-item">
          <h3 class="home-paper-title pub-item-title">
            <a href="{{ base_path }}{{ post.url }}">{{ post.title }}</a>
          </h3>
          <p class="home-paper-meta pub-item-meta">
            <span class="home-paper-year">{{ post.date | date: "%Y" }}</span>
            {% if post.venue %}
              {% unless excluded_venues contains post.venue %}
                <span class="home-paper-sep">-</span>
                <span class="home-paper-venue">{{ post.venue }}</span>
              {% endunless %}
            {% endif %}
          </p>
          {% if post.tldr %}
            <p class="home-paper-tldr pub-item-tldr">
              <span class="home-paper-tldr-label">TL;DR</span>
              <span class="home-paper-tldr-text">{{ post.tldr }}</span>
            </p>
          {% endif %}
        </article>
      </li>
    {% endfor %}
  </ul>
  <p class="home-publications-link"><a href="{{ base_path }}/publications/">View all publications</a></p>
</section>
