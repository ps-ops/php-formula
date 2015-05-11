{% set version = salt['pillar.get']('php:version', '5.4') %}

{% if grains['os_family'] == "RedHat" %}
  {% if version == "5.6" %}

#    epel_release:
#      pkgrepo.managed:
#        - humanname: Webtatic EPEL
#        - mirrorlist: https://mirror.webtatic.com/yum/el7/$basearch/mirrorlist
#        - require_in:
#          - pkg: php56w

    webtatic:
      pkgrepo.managed:
        - humanname: Webtatic Repository EL7 - $basesearch
        - mirrorlist: https://mirror.webtatic.com/yum/el7/$basearch/mirrorlist
        - require_in:
          - pkg: php56w

    php56w:
      pkg.installed: []

  {% endif %}
{% endif %}