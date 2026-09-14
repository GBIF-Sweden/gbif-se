---
layout: default
title: Data Fika
permalink: /:basename/
description: >-
  Data Fika is GBIF Sweden's free monthly online series for data stewards and researchers
  working with biodiversity data - ten short sessions on finding, using, cleaning and
  publishing GBIF-mediated data, running September 2026 to June 2027.
---

# {{ page.title }}

<p class="preamble">
  A monthly online fika about biodiversity data. Ten short sessions - from your first GBIF
  download to a fully reproducible research workflow - for data stewards and researchers at
  Swedish universities, museums, botanical gardens and data infrastructures.
</p>

<div class="mt-6 mb-8 px-4 py-3 bg-gbif-green-light rounded-sm">
  <ul class="mb-0">
    <li><strong>When:</strong> once a month on Fridays, 11:00–11:45 (Swedish time), September 2026 – June 2027</li>
    <li><strong>Where:</strong> online — the video link will be sent with the invitation</li>
    <li><strong>Format:</strong> 20–30 minute presentation followed by ~15 minutes hands-on work and Q&amp;A</li>
    <li><strong>Cost:</strong> free — bring your own coffee</li>
    <li><strong>How to join:</strong> email <a href="mailto:lena.thole@nrm.se">lena.thole@nrm.se</a> or <a href="mailto:gbif@nrm.se">gbif@nrm.se</a> to be added to the invitation list</li>
  </ul>
</div>

## About the series

Data Fika is a GBIF-centered training series built around the researcher's journey with
GBIF-mediated data. Rather than front-loading theory, participants handle a real GBIF
download from the second session onwards; standards, the data model, data cleaning and
fitness for use are then taught against data you already have in hand. Publishing your own
data to GBIF is covered in a dedicated, steward-facing session towards the end of the series.

The series is aimed at data stewards and researchers working with biodiversity data at
Swedish universities, natural history museums, botanical gardens and national data
infrastructures — but anyone interested in open biodiversity data is welcome.

Each session stands on its own, so you can join the whole series or just the sessions that
are relevant to you. Recordings and materials are shared with participants after each session.

## How to join

Email [lena.thole@nrm.se](mailto:lena.thole@nrm.se) or [gbif@nrm.se](mailto:gbif@nrm.se) with *Data Fika* in the subject line to be added to
the invitation list. You will receive calendar invitations with the zoom link, and the
materials after each session. 

Participation is free and no preparation is needed.

Help us spread the word — download the [Data Fika flyer](/uploads/data-fika-flyer.pdf)
(PDF) and share it with colleagues or pin it up by the coffee machine.

## Programme 2026/27


<p class="text-slate-600 text-base">Sessions take place on the second Friday of the month (June: first Friday), 11:00–11:45.</p>


<table class="w-full mt-4 mb-2">
  <thead>
    <tr class="bg-gbif-green text-white">
      <th class="p-2 text-left">#</th>
      <th class="p-2 text-left">Date</th>
      <th class="p-2 text-left">Session</th>
      <th class="p-2 text-left hidden md:table-cell">Topics</th>
      <th class="p-2 text-left"><span class="hidden md:table-cell">Material</span></th>
      <th class="p-2 text-left"><span class="hidden md:table-cell">Recording</span></th>
    </tr>
  </thead>
  <tbody>
  {% for session in site.data.data-fika %}
    <tr class="border-b border-slate-200 align-top">
      <td class="p-2">{{ forloop.index }}</td>
      <td class="p-2 whitespace-nowrap">{{ session.date }}</td>
      <td class="p-2"><strong>{{ session.title }}</strong></td>
      <td class="p-2 hidden md:table-cell">{{ session.topics }}</td>
      <td class="p-2 text-center">
        {% if session.material %}
          <a href="https://www.gbif.se/uploads2/data-fika/{{ session.material }}" title="View session material">
            {%- include icons/file-pdf.html class="h-6 inline" -%}
          </a>
        {% endif %}
      </td>
      <td class="p-2 text-center">
        {% if session.recording %}
          <a href="https://www.gbif.se/uploads2/data-fika/{{ session.recording }}" title="View session recording">
            {%- include icons/video.html class="h-6 inline" -%}
          </a>
        {% endif %}
      </td>
    </tr>
  {% endfor %}
  </tbody>
</table>


## Companion workshops

Four optional 2-hour companion events let you go deeper, : 

- 16 Oct 2026 10-12 **a hands-on download workshop after session 2** 
<a class="ml-2 px-2.5 pt-1 pb-1 bg-gbif-green text-white rounded-sm shadow-md hover:bg-slate-300 hover:text-slate-800 hover:no-underline" 
href="https://nrm-se.zoom.us/webinar/register/WN_6Mr6haMVS-WxJs6tz_XSsQ">Register</a>
- 19 Feb 2027 10-12 **one extended cleaning-and-fitness workshop combining sessions 5 and 6**
- 16 Apr 2027 10-12 **a CARE discussion (about one hour) with invited speakers alongside session 8**
-  4 Jun 2027 13-15 **a data-integration deep-dive after session 10.**

Dates for the workshops are announced with the session invitations.

## Contact

Data Fika is organised by GBIF Sweden, hosted at the Swedish Museum of Natural History
(NRM). Questions, suggestions for topics, or want to present something at a session?
Contact us at [lena.thole@nrm.se](mailto:lena.thole@nrm.se) or [gbif@nrm.se](mailto:gbif@nrm.se).
