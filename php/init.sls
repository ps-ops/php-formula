{% from "php/map.jinja" import php with context %}

{% set version = salt['pillar.get']('php:version', '5.4') %}
{% if version != '5.4' %}
  include:
    - version
{% endif %}