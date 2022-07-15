include:
  - myuser.user

install_git:
  pkg.installed:
    - name: git

clone_dotfiles:
  git.latest:
    - name: https://github.com/basepi/dotfiles.git
    - rev: master
    - target: /home/mkg/dotfiles
    - user: mkg
    - submodules: True
    - require:
      - pkg: install_git
      - user: add_user_mkg

install_dotfiles_if_changed:
  cmd.run:
    - name: 'python3 install.py -y'
    - cwd: '/home/mkg/dotfiles'
    - user: mkg
    - onchanges:
      - git: clone_dotfiles
