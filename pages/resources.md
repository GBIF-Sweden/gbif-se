---
layout: default
title: Resources
permalink: /:basename/
---

# {{ page.title }}

<div class="mt-8 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
{% for resource in site.data.resources %}
  <div class="border border-gray-300">
    <a href="{{ resource.link }}" title="{{ resource.name }}">
      <img src="/uploads/{{ resource.image }}" alt="">
    </a>
    <div class="p-4">
      <a href="{{ resource.link }}">{{ resource.name }}</a>
      <div class="mt-2 text-gray-600">{{ resource.description }}</div>
    </div>
  </div>
{% endfor %}
</div>
