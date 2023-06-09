---
layout: default
title: Contact
permalink: /:basename/
---

# {{ page.title }}

For general inquiries and support use [gbif@nrm.se](mailto:gbif@nrm.se). It is also possible to reach us through the [SBDI support form](https://docs.biodiversitydata.se/support/).

<article>
  <h2>GBIF Sweden staff</h2>
  <div class="mt-4 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-x-8 gap-y-4">
  {% for staff in site.data.staff %}
    <article>
      {% if staff.image %}
        <img src="/uploads/staff/{{ staff.image }}" class="h-56" alt="">
      {% endif %}
      <address>
      <h3 class="text-lg mb-0">{{ staff.name }}</h3>
      <div>{{ staff.title }}</div>
      <div>{{ staff.organisation }}</div>
      <div>{{ staff.address }}</div>
      <div>{{ staff.zip }} {{ staff.city }}</div>
      <div>{{ staff.country | default: "Sweden" }}</div>
      <div><a href="mailto:{{ staff.email }}">{{ staff.email }}</a></div>
      <div><a href="tel:{{ staff.phone }}">{{ staff.phone }}</a></div>
      </address>
    </article>
  {% endfor %}
  </div>
</article>


<article class="mt-8 border-t-2 border-slate-200">
  <h2>Mailing address</h2>
  <address>
    GBIF Sweden<br>
    PO Box 500 07<br>
    104 05 Stockholm<br>
    Sweden<br>
  </address>
</article>

<article class="mt-8 border-t-2 border-slate-200">
  <h2>Visiting address</h2>
  <address>
    Swedish Museum of Natural History<br>
    Naturhistoriska riksmuseet<br>
    Frescativägen 40<br>
    114 18 Stockholm<br>
  </address>
</article>
