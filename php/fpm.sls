{% from "php/map.jinja" import php with context %}

{% set fpm_pkg = salt['pillar.get']('php:fpm_pkg', php.fpm_pkg) %}

php-fpm:
  pkg.installed:
    - name: {{ fpm_pkg }}
  service.running:
    - name: {{ php.fpm_service }}
    - enable: True
