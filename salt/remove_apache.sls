remove apache2:
  salt.module.pkg.remove:
    - name: apache2
