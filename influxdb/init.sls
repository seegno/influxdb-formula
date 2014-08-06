{% from "influxdb/map.jinja" import map with context %}

influxdb_package:
  file:
    - managed
    - name: /tmp/influxdb.deb
    - source: http://s3.amazonaws.com/influxdb/{{ map["package"] }}
    - source_hash: md5={{ map["md5"] }}
