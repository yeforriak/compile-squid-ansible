require_relative 'spec_helper'

describe service('squid') do
  it { should be_running }
end

describe port(3127) do
  it { should be_listening }
end