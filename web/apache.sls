{% if grains['os'] == 'RedHat' %}
{% 	set name = 'httpd' %}
{% elif grains['os'] == 'Ubuntu' %}
{% 	set name = 'apache2' %}
{% endif %}
install_apache:
  pkg.installed:
    - name: {{ name }}

ensure_apache_is_running:
  service.running:
    - name: {{ name }}
    - enable: True
    - require:
      - install_apache
    - watch:
      - sync mod_status.conf
      - sync mod_status.load

copy index.html file:
  file.managed:
    - name: /var/www/html/index.html
    - source: salt://index.html
    - require:
      - ensure_apache_is_running

sync mod_status.conf:
  file.managed:
    - name: /etc/apache2/mods-enabled/mod_status.conf
    - source: salt://mod_status.conf
    - user: root
    - group: root
    - mode: 600

sync mod_status.load:
  file.managed:
    - name: /etc/apache2/mods-enabled/mod_status.load
    - source: salt://mod_status.load
    - user: root
    - group: root
    - mode: 600
