{% from "php/map.jinja" import php with context %}

php-fpm:
  pkg.installed:
    - name: {{ php.fpm_pkg }}
  service.running:
    - name: {{ php.fpm_service }}
    - enable: True
    - restart: True
    - watch:
      - file: /etc/php-fpm.d/*
      - file: /etc/php.ini
