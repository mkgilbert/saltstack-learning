install my cool config:
  file.managed:
    - name: /etc/myconfig/myconfig.conf
    - source: salt://data/myconfig.conf
    - user: root
    - group: root
    - mode: 755
    - makedirs: True
