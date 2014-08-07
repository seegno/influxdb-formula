require "serverspec"

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe service("influxdb") do
  it { should be_enabled }
  it { should be_running }
end

describe "InfluxDB Server" do

  it "has a daemon runing" do
    expect(service("influxdb")).to be_running
  end

end

