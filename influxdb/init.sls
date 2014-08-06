{% from "influxdb/map.jinja" import map with context %}

influxdb_package:
  file:
    - managed
    - name: /tmp/influxdb.deb
    - source: http://s3.amazonaws.com/influxdb/{{ map["package"] }}
    - source_hash: md5={{ map["md5"] }}

install_influxdb:
  pkg:
    - installed
    - sources:
      - influxdb: /tmp/influxdb.deb
    - require:
      - file: influxdb_package
    - watch:
      - file: influxdb_package
