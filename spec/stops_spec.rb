require 'spec_helper'

describe Stops do
  describe 'initalize' do
    it 'creates an instance of Stop' do
      test_stop = Stops.new({'station_id' => 1, 'line_id' => 2})
      test_stop.should be_an_instance_of Stops
    end
  end

   describe 'all' do
    it 'starts off as an empty array' do
      Stops.all.should eq []
    end
  end

  describe 'save' do
    it 'saves all inputs into the database' do
      test_stop = Stops.new({'station_id' => 1, 'line_id' => 2})
      test_stop.save
      Stops.all.should eq [test_stop]
    end
  end

  describe 'is the same stations if it has the same name' do
    it 'recognizes a match name in the database' do
      stop1 = Stops.new({'station_id' => 1, 'line_id' => 2})
      stop2 = Stops.new({'station_id' => 1, 'line_id' => 2})
      stop1.should eq stop2
    end
  end
end
