require 'spec_helper'

describe Stations do
  it 'initializes with a name' do
    stations = Stations.new({'name' => 'Beaverton'})
    stations.should be_an_instance_of Stations
  end
  it 'gives us a name & id ' do
    station = Stations.new({'name' => 'Beaverton', 'id' => 2})
    station.name.should eq 'Beaverton'
    station.id.should eq 2
  end
  it 'starts off with no stops' do
    Stops.all.should eq []
  end

  describe '.all' do
    it 'starts empty' do
      Stations.all.should eq []
    end
    it 'gives me all stations from the database' do
      test_station = Stations.new({'name' => 'Portland', 'id' => 2})
      test_station.save
      Stations.all.should eq [test_station]
    end
  end
    it 'is the same stations if it has the same name' do
     test_station1 = Stations.new('Beaverton')
     test_station2 = Stations.new('Beaverton')
     test_station1.should eq test_station2
    end
end
