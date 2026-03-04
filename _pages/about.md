---
permalink: /
title: "About me"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

I am a postdoctoral researcher specializing in Trustworthy Machine Learning (TML), with a focus on healthcare applications. I earned my PhD in Computer Science from Ghent University in 2023, where my dissertation centered on quantifying uncertainty and improving the reliability of time-series-based deep learning models. I have a strong background in machine learning, with experience spanning academia and industry. My postdoctoral work focuses on advancing state-of-the-art methodologies for healthcare diagnostics. I am open to talks, please contact me on one of the channels shown on the left.

## Research overview

My recent work spans trustworthy ML for healthcare, uncertainty-aware modeling, and radar/sensor-based activity recognition, with a strong focus on reliability in real-world deployment.

{% assign pubs_total = site.publications | size %}
{% assign pubs_sorted = site.publications | sort: "date" | reverse %}
{% assign pubs_recent = pubs_sorted | slice: 0, 3 %}
{% assign excluded_venues = "medRxiv" | split: "|" %}
{% assign recent_venues = pubs_recent | map: "venue" | compact | uniq %}

- Publications: **{{ pubs_total }}** total
- Recent venues include {% assign shown_count = 0 %}{% for venue in recent_venues %}{% unless excluded_venues contains venue %}{% assign shown_count = shown_count | plus: 1 %}{% endunless %}{% endfor %}{% assign shown_index = 0 %}{% for venue in recent_venues %}{% unless excluded_venues contains venue %}{% assign shown_index = shown_index | plus: 1 %}{% if shown_index > 1 %}{% if shown_index == shown_count %} and {% else %}, {% endif %}{% endif %}{{ venue }}{% endunless %}{% endfor %}

### Recent papers

{% for post in pubs_recent %}
- [{{ post.title }}]({{ base_path }}{{ post.url }}) ({{ post.date | date: "%Y" }})
{% endfor %}
