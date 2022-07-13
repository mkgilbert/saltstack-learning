install vim:
  pkg.installed:
    - name: {{ pillar['editor'] }}

create_new_dir:
  file.directory:
    - name: /opt/new_dir
    - user: root
    - group: root
    - mode: 755

mysql is running:
  pkg.installed:
    - name: mysql-server
  service.running:
    - name: mysql
    - enable: True

clone SaltStack bootstrap script repo:
  pkg.installed:
    - name: git
  git.latest:
    - name: https://github.com/saltstack/salt-bootstrap
    - rev: develop
    - target: /tmp/salt

user account for mike:
  user.present:
    - name: mike
    - shell: /bin/bash
    - home: /home/mike
    - groups:
      - sudo

add salt master to hosts:
  host.present:
    - name: salt-master-dev
    - ip: 10.0.0.100
