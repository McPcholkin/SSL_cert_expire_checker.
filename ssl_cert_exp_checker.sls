{% from "zabbix/ng/map.jinja" import zabbix with context %}

include:
  - zabbix.ng.agent.install

openssl_install:
  pkg.installed:
    - name: {{ zabbix.openssl }}

ssl_cert_exp_monitor.sh:
  file.managed:
    - name: /usr/local/share/zabbix/externalscripts/ssl_cert_exp_monitor.sh
    - source: {{ slspath }}/files/ssl_cert_exp_checker/ssl_cert_exp_monitor.sh
    - user: {{ zabbix.user }}
    - group: {{ zabbix.group }}
    - mode: 644
    - makedirs: True
    - watch_in:
      - service: install_zabbix_agent    

