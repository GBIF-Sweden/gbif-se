---
layout: base
title: News
---

# {{ page.title }}

{% for post in site.posts %}
<div>
    <h3>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
    </h3>
    <p>{{ post.summary }}</p>
    <p> Published: {{ post.date | date: "%b %d, %Y %H:%M" }}</p>
</div>
{% endfor %}
