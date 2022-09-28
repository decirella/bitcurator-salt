{% set user = salt['pillar.get']('bitcurator_user', 'bcadmin') %}

include:
  - bitcurator.config.user.user

mimeapps:
  file.managed:
    - name: /home/{{ user }}/.config/mimeapps.list
    - source: salt://bitcurator/files/mimeapps.list
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - require:
      - sls: bitcurator.packages.vim
