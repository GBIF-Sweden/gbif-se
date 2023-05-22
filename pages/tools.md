---
layout: base
title: Tools
permalink: /:basename/
---

# {{ page.title }}

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ullamcorper venenatis iaculis. In ullamcorper viverra lorem, quis consequat dolor mattis a. Curabitur facilisis nulla purus, nec tincidunt nisi tristique eu.

<div class="mt-8 grid grid-cols-1 md:grid-cols-2 gap-8">
  {% for tool in site.data.tools %}
    <div>
      <h2 class="mb-2">{{ tool.name }}</h2>
      <div class="mb-2">{{ tool.description }}</div>
      {% if tool.link %}
        <a class="text-xl" href="{{ tool.link }}">&raquo; {{ tool.linktitle | default: tool.name }}</a>
      {% endif %}
    </div>
  {% endfor %}
</div>
