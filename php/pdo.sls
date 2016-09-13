{% from "php/map.jinja" import php with context %}

php-pdo:
  pkg.installed:
    - name: {{ php.pdo_pkg }}
    - watch_in:
       - service: 
         - name: php-fpm
         - init_delay: 1
