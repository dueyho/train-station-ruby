require 'spec_helper'

describe Stops do
  it 'is initialized with a name'  do
    stop = Stops.new('Beaverton')
    stop.should be_an_instance_of Stops
  end

  it 'displays the name' do
    stop = Stops.new('Beaverton')
    stop.name.should eq 'Beaverton'
  end

  it 'starts off with no stops' do
  Stops.all.should eq []
  end

  it 'lets you save Stops' do
    stop = Stops.new('Beaverton')
    stop.save
    Stops.all.should eq [stop]
  end

  it 'is the same stop of it has the same name' do
    stop1 = Stops.new('Beaverton')
    stop2 = Stops.new('Beaverton')
    stop1.should eq stop2
  end
end
