require "serverspec"

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = "/sbin:/usr/sbin"
  end
end

describe "InfluxDB Server" do

  it "has a daemon runing" do
    expect(service("influxdb")).to be_running
  end

end

