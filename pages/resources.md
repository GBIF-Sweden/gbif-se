---
layout: default
title: Resources
permalink: /:basename/
---

# {{ page.title }}

<div class="mt-8 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
{% for resource in site.data.resources %}
  <article class="shadow-md cursor-pointer hover:bg-slate-200" onclick="location.href='{{ resource.link }}';">
    <img src="/uploads/{{ resource.image }}" class="w-full h-48" alt="">
    <div class="px-4 py-2">
      <h3><a href="{{ resource.link }}">{{ resource.name }}</a></h3>
      <p class="mb-1 text-slate-600">{{ resource.description }}</p>
    </div>
  </article>
{% endfor %}
</div>
