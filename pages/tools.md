---
layout: default
title: Tools
permalink: /:basename/
---

# {{ page.title }}

<p class="preamble">
GBIF provides tools for publishing, accessing and using biodiversity data. Here we list a subset of tools available. For a more detailed list of tools available within the community, go to the <a href="https://www.gbif.org/resource/search?contentType=tool">GBIF Tools Catalogue</a> or visit the <a href="https://tools.biodiversitydata.se/">SBDI Tools webpage</a>.
</p>

{% for tool_group in site.data.tools %}
  <article>
    <h2>{{ tool_group.name }}</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
      {% for tool in tool_group.items %}
        <article class="bg-slate-100 shadow-md px-3 cursor-pointer hover:bg-slate-200" onclick="location.href='{{ tool.link }}';">
          <h3 class="mb-2"><a href="{{ tool.link }}">{{ tool.name }}</a></h3>
          <p>{{ tool.description }}</p>
        </article>
      {% endfor %}
    </div>
  </article>
{% endfor %}
