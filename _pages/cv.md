---
layout: archive
title: "Curriculum Vitae"
section_label: "About me"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

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
      <p class="cv-tagline">Postdoctoral researcher at IDLab &ndash; Ghent University working on trustworthy machine learning and uncertainty quantification, with applications spanning healthcare diagnostics, time-series analysis, and control.</p>
    </section>

    <section class="cv-section cv-section--publications">
      <h2><i class="fa-solid fa-book-open" aria-hidden="true"></i> Selected Publications</h2>
      <ol class="cv-publications">
        <li>
          <strong>Werthen-Brabants, L.</strong>, et al. (2024). "Deep Learning-Based Event Counting for Apnea-Hypopnea Index Estimation using Recursive Spiking Neural Networks." <em>IEEE Transactions on Biomedical Engineering</em>.
        </li>
        <li>
          <strong>Werthen-Brabants, L.</strong>, et al. (2022). "Split BiRNN for real-time activity recognition using radar and deep learning." <em>Scientific Reports</em>.
        </li>
        <li>
          <strong>Werthen-Brabants, L.</strong>, et al. (2022). "Uncertainty quantification for appliance recognition in non-intrusive load monitoring using Bayesian deep learning." <em>Energy and Buildings</em>.
        </li>
        <li>
          Bhavanasi, G., <strong>Werthen-Brabants, L., et al.</strong> (2022). "Patient activity recognition using radar sensors and machine learning." <em>Neural Computing and Applications</em>.
        </li>
        <li>
          Castillo-Escario, Y., <strong>Werthen-Brabants, L.</strong>, et al. (2022). "Convolutional neural networks for Apnea detection from smartphone audio signals: effect of window size." <em>IEEE EMBC Conference</em>.
        </li>
      </ol>
    </section>

    <section class="cv-section cv-section--experience">
      <h2><i class="fa-solid fa-briefcase" aria-hidden="true"></i> Professional Experience</h2>
      <div class="cv-timeline">
        <article class="cv-timeline-item">
          <p class="cv-date">2025-2028</p>
          <div class="cv-item-body">
            <h3>Postdoctoral Fellow</h3>
            <p>FWO &amp; IDLab - imec, Ghent University</p>
            <p>Focus on Trustworthy Machine Learning (TML) and uncertainty quantification in deep learning models, with applications in healthcare diagnostics. Grant number 1264826N.</p>
          </div>
        </article>
        <article class="cv-timeline-item">
          <p class="cv-date">2023-2025</p>
          <div class="cv-item-body">
            <h3>Postdoctoral Researcher</h3>
            <p>IDLab - imec, Ghent University</p>
            <p>Research focused on emerging probabilistic hardware (p-bits), with a focus on Model Predictive Control</p>
          </div>
        </article>
        <article class="cv-timeline-item">
          <p class="cv-date">2019-2023</p>
          <div class="cv-item-body">
            <h3>PhD Student</h3>
            <p>IDLab - imec, Ghent University</p>
            <p>Title of dissertation: "Quantifying Uncertainty and Improving Reliability of Time-Series Based Deep Learning Models".</p>
          </div>
        </article>
        <article class="cv-timeline-item">
          <p class="cv-date">2018-2019</p>
          <div class="cv-item-body">
            <h3>Machine Learning Engineer</h3>
            <p>Robovision</p>
            <p>Developed machine learning pipelines for computer vision applications, transitioning to academia for deeper exploration of research questions.</p>
          </div>
        </article>
      </div>
    </section>

    <section class="cv-section cv-section--education">
      <h2><i class="fa-solid fa-graduation-cap" aria-hidden="true"></i> Education</h2>
      <div class="cv-timeline">
        <article class="cv-timeline-item">
          <p class="cv-date">2019-2023</p>
          <div class="cv-item-body">
            <h3>PhD in Computer Science</h3>
            <p><em>Ghent University</em></p>
            <p>Dissertation: "Quantifying Uncertainty and Improving Reliability of Time-Series Based Deep Learning Models"</p>
            <p>Promotors: Prof. dr. ir. Tom Dhaene, Prof. dr. mult. Dirk Deschrijver</p>
          </div>
        </article>
        <article class="cv-timeline-item">
          <p class="cv-date">2016-2018</p>
          <div class="cv-item-body">
            <h3>MSc in Computer Science</h3>
            <p><em>Ghent University</em></p>
            <p>Thesis: Focused on machine learning methods for time-series data.</p>
          </div>
        </article>
        <article class="cv-timeline-item">
          <p class="cv-date">2013-2016</p>
          <div class="cv-item-body">
            <h3>BSc in Informatics</h3>
            <p><em>Ghent University</em></p>
          </div>
        </article>
      </div>
    </section>

    <section class="cv-section cv-section--grants">
      <h2><i class="fa-solid fa-medal" aria-hidden="true"></i> Grants and Awards</h2>
      <div class="cv-band">
        <article class="cv-row">
          <h3 class="cv-row-title">FWO Postdoctoral Fellowship</h3>
          <p class="cv-row-text">Funded by the Research Foundation Flanders (FWO) for postdoctoral research on Trustworthy ML and uncertainty quantification in deep learning (2025-2028).</p>
        </article>
        <article class="cv-row">
          <h3 class="cv-row-title">Academic Representation</h3>
          <p class="cv-row-text">Selected as a PhD representative for the Flanders AI Research Program (2023).</p>
        </article>
      </div>
    </section>

    <section class="cv-section cv-section--talks">
      <h2><i class="fa-solid fa-person-chalkboard" aria-hidden="true"></i> Invited Talks</h2>
      <div class="cv-band">
        <article class="cv-row">
          <h3 class="cv-row-title">Trustworthy and Reliable (Deep) Machine Learning for Healthcare</h3>
          <p class="cv-row-text">IBEC, Barcelona, Spain (2025)</p>
        </article>
        <article class="cv-row">
          <h3 class="cv-row-title">Trustworthy ML for Healthcare: Challenges and Developments</h3>
          <p class="cv-row-text">Winkelhaak, Antwerp, Belgium (2024)</p>
        </article>
      </div>
    </section>

    <section class="cv-section cv-section--leadership">
      <h2><i class="fa-solid fa-chalkboard-user" aria-hidden="true"></i> Teaching and Supervision</h2>
      <div class="cv-band">
        <article class="cv-row">
          <h3 class="cv-row-title">Teaching Assistant</h3>
          <p class="cv-row-text">Courses on Computer Science, Machine Learning, and Logic at Ghent University (2019-Present).</p>
        </article>
        <article class="cv-row">
          <h3 class="cv-row-title">Master's Thesis Supervision</h3>
          <p class="cv-row-text">Supervised multiple Master's theses, with students publishing conference papers under guidance.</p>
          <p class="cv-row-text"><strong>Vincent-De Sloover, Louis, et al.</strong> "Tailoring Radar-Based Patient Monitoring Models to Real-Life Needs using Utility Maximization." 2022 19th European Radar Conference (EuRAD). IEEE, 2022.</p>
          <p class="cv-row-text"><strong>Tuytte, Victor, et al.</strong> "Optimized Data Transmission for Radar-Based Edge-Cloud Human Activity Recognition via Quantization." 2024 21st European Radar Conference (EuRAD). IEEE, 2024.</p>
        </article>
      </div>
    </section>

    <section class="cv-section cv-section--service">
      <h2><i class="fa-solid fa-handshake-angle" aria-hidden="true"></i> Service and Outreach</h2>
      <div class="cv-band">
        <article class="cv-row">
          <h3 class="cv-row-title">Peer Review Service</h3>
          <p class="cv-row-text">Regular reviewer for <em>Scientific Reports</em> and <em>IEEE Transactions on Biomedical Engineering</em>.</p>
        </article>
        <article class="cv-row">
          <h3 class="cv-row-title">Science Communication</h3>
          <p class="cv-row-text">Featured in public AI discussions, including television appearances (e.g., Karrewiet 2019, VRT NWS Laat 2024).</p>
        </article>
      </div>
    </section>

    <section class="cv-section cv-section--mobility">
      <h2><i class="fa-solid fa-earth-europe" aria-hidden="true"></i> Mobility and Research Stays</h2>
      <div class="cv-band">
        <article class="cv-row">
          <h3 class="cv-row-title">Visiting Researcher</h3>
          <p class="cv-row-text"><em>University of Sydney, Australia (2022)</em></p>
        </article>
      </div>
    </section>

    <section class="cv-section cv-section--interests">
      <h2><i class="fa-solid fa-lightbulb" aria-hidden="true"></i> Research Interests</h2>
      <p class="cv-tagline">Trustworthy Machine Learning (TML) · Uncertainty Quantification in Deep Learning · Event-Based Time Series Analysis · Multimodal Data Integration · Self-Supervised Learning for Healthcare Applications</p>
    </section>

    <section class="cv-section cv-section--skills">
      <h2><i class="fa-solid fa-screwdriver-wrench" aria-hidden="true"></i> Skills</h2>
      <div class="cv-band">
        <article class="cv-row">
          <h3 class="cv-row-title">Programming Languages</h3>
          <div class="cv-skill-list">
            <span class="cv-skill"><i class="fa-brands fa-python" aria-hidden="true"></i> Python</span>
            <span class="cv-skill"><i class="fa-solid fa-code" aria-hidden="true"></i> C</span>
            <span class="cv-skill"><i class="fa-solid fa-code" aria-hidden="true"></i> C++</span>
            <span class="cv-skill"><i class="fa-solid fa-square-root-variable" aria-hidden="true"></i> MATLAB</span>
          </div>
        </article>
        <article class="cv-row">
          <h3 class="cv-row-title">Deep Learning Frameworks</h3>
          <div class="cv-skill-list">
            <span class="cv-skill"><i class="fa-solid fa-network-wired" aria-hidden="true"></i> TensorFlow</span>
            <span class="cv-skill"><i class="fa-solid fa-microchip" aria-hidden="true"></i> PyTorch</span>
          </div>
        </article>
        <article class="cv-row">
          <h3 class="cv-row-title">Data Science</h3>
          <p class="cv-row-text">Time Series Analysis, Uncertainty Quantification, Statistical Modeling, Data Visualization.</p>
        </article>
        <article class="cv-row">
          <h3 class="cv-row-title">Languages</h3>
          <div class="cv-inline-meta">
            <span class="cv-pill">English (C2)</span>
            <span class="cv-pill">Dutch (C2, Native)</span>
            <span class="cv-pill">French (B2)</span>
            <span class="cv-pill">Spanish (A2)</span>
          </div>
        </article>
      </div>
    </section>
  </div>
</div>

<!-- ## Publications

<ul>{% for post in site.publications reversed %}
  {% include archive-single-cv.html %}
{% endfor %}</ul> -->
  
<!-- Talks
======
  <ul>{% for post in site.talks reversed %}
    {% include archive-single-talk-cv.html  %}
  {% endfor %}</ul> -->
  
<!-- Teaching
======
  <ul>{% for post in site.teaching reversed %}
    {% include archive-single-cv.html %}
  {% endfor %}</ul> -->
