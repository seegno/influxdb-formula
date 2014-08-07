require "serverspec"

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

end

describe "InfluxDB Server" do

  it "has a daemon runing" do
    expect(service("influxdb")).to be_running
  end

end

