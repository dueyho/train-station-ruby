require 'spec_helper'

describe Stations do
  it 'initializes with a name' do
    stations = Stations.new('Italy')
    stations.should be_an_instance_of Stations
  end

  it 'displays a name' do
    stations = Stations.new('Italy')
    stations.name.should eq 'Italy'
  end

  it 'starts off with no stops' do
    Stops.all.should eq []
  end

  it 'is the same stations if it has the same name' do
    test_station1 = Station.new('Italy')
    test_station2 = Station.new('Italy')
    test_station1.should eq test_station2
  end
end
