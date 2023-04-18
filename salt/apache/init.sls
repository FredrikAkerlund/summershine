apache2:
  pkg.installed
/etc/apache2/sites-available/:
  file.managed:
    - name: "/etc/apache2/sites-available/frontpage.conf"
    - source: "salt://apache/frontpage.conf"
/home/vagrant/public_sites/:
  file.managed:
    - name: "/home/vagrant/public_sites/index.html"
    - makedirs: "true"
    - source: "salt://apache/index.html"
frontpage:
  cmd.run:
    - name: "sudo a2ensite frontpage.conf"
    - name: "sudo a2dissite 000-default.conf"
apache2.service:
  service.running:
    - watch:
      - file: "/etc/apache2/sites-available/frontpage.conf"
