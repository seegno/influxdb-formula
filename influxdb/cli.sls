cli_dependencies:
  pkg.installed:
    - pkgs:
      - build-essential
      - ruby
      - ruby-dev

cli_gem:
  gem.installed:
    - name: influxdb-cli
    - require:
        - pkg: cli_dependencies
