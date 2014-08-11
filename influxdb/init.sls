{% from "influxdb/map.jinja" import map with context %}

influxdb_package:
  file:
    - managed
    - name: /tmp/influxdb.deb
    - source: http://s3.amazonaws.com/influxdb/{{ map["package"] }}
    - source_hash: md5={{ map["md5"] }}

influxdb_install:
  pkg:
    - installed
    - sources:
      - influxdb: /tmp/influxdb.deb
    - require:
      - file: influxdb_package
    - watch:
      - file: influxdb_package

influxdb_confdir:
  file:
    - directory
    - name: /etc/influxdb
    - owner: root
    - group: root
    - mode: 755

influxdb_config:
  file:
    - managed
    - name: /etc/influxdb/config.toml
    - source: salt://influxdb/templates/config.toml.jinja
    - owner: root
    - group: root
    - mode: 644
    - template: jinja

influxdb_init:
  file:
    - managed
    - name: /etc/init.d/influxdb
    - source: salt://influxdb/files/influxdb.service
    - owner: root
    - group: root
    - mode: 755

influxdb_user:
  user:
    - present
    - name: influxdb
    - fullname: InfluxDB Service User
    - shell: /bin/false
    - home: /opt/influxdb

influxdb_start:
  service:
    - running
    - name: influxdb
    - enable: True
    - watch:
      - pkg: influxdb_install
      - file: influxdb_package
      - file: influxdb_config
    - require:
      - pkg: influxdb_install
      - file: influxdb_package
