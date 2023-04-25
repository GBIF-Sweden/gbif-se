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
    <p> Published {{ post.date }} by {{ post.authors}} </p>
</div>
{% endfor %}
