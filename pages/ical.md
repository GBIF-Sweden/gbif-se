---
layout: default
permalink: /:basename/
---

# ical

{% ical url: https://api.gbif.org/v1/newsroom/events/calendar/upcoming.ics reverse: false %}
  summary: {{ event.summary }}

  start_time: {{ event.start_time }}

  dtstart: {{ event.dtstart }}

  end_time: {{ event.end_time }}

  dtend: {{ event.dtend }}

  url: {{ event.url }}

  desc: {{ event.description }}

  simple_html: {{ event.simple_html_description }}

  location: {{ event.location }}

  att: {{ event.attendees }}

  <hr>
{% endical %}