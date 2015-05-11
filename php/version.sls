{% set version = salt['pillar.get']('php:version', '5.4') %}

{% if grains['os_family'] == "RedHat" %}
  {% if version == "5.6" %}

    epel_release:
      pkgrepo.managed:
        - humanname: PHP 5.6 EPEL
        - baseurl: https://mirror.webtatic.com/yum/el7/epel-release.rpm
        - require_in:
          - pkg: php56w

    php56w:
      pkgrepo.managed:
        - humanname: PHP 5.6
        - baseurl: https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
        - require_in:
          - pkg: php56w
      pkg.installed: []

  {% endif %}
{% endif %}