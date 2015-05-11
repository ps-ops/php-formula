{% from "php/map.jinja" import php with context %}

{% set version = salt['pillar.get']('php:version', '5.4') %}
{% if version != '5.4' %}
  include:
    - php.version
{% else %}

  {% set use_ppa = salt['pillar.get']('php:use_ppa', none) %}

  {% if use_ppa is not none %}
    {% set ppa_name = salt['pillar.get']('php:ppa_name', 'ondrej/php5') %}

    {% if grains['os_family']=="Debian" %}

      php54:
          pkgrepo.managed:
              - ppa: {{ ppa_name }}
          pkg.latest:
              - name: {{ php.php_pkg }}
              - refresh: True

    {% endif %}
  {% endif %}

  php:
    pkg.installed:
      - name: {{ php.php_pkg }}

{% endif %}