install_zsh:
  pkg.installed:
    - name: zsh

add_user_mkg:
  user.present:
    - name: mkg
    - shell: /bin/zsh
    - require:
      - pkg: install_zsh
