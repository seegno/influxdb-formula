require "serverspec"

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe service("influxdb") do
  it { should be_enabled }
  it { should be_running }
end

influxdb_ports = [8083, 8086, 8099, 8090]
for influxdb_port in influxdb_ports do
  describe port(influxdb_port) do
    it { should be_listening }
  end
end
