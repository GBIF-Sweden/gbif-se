---
layout: base
title: Events
---

# {{ page.title }}

{% for event in site.events %}
    <div>
        <h3>
            <a href="{{ event.url | relative_url }}">{{ event.title }}</a>
        </h3>
        <p>{{ event.when }}</p>
    </div>
{% endfor %}
