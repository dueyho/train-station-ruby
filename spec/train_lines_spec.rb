require 'spec_helper'

describe Lines do
  it 'initializes with a color' do
    line = Lines.new({'color' => 'Red'})
    line.should be_an_instance_of Lines
  end
  it 'gives us a color & id ' do
    line = Lines.new({'color' => 'Red', 'id' => 2})
    line.color.should eq 'Red'
    line.id.should eq 2
  end
  it 'starts off with no lines' do
    Lines.all.should eq []
  end

  describe '.all' do
    it 'starts empty' do
      Lines.all.should eq []
    end
    it 'returns all the lines of the database' do
      test_line = Lines.new({'color' => 'Red', 'id' => 2})
      test_line.save
      Lines.all.should eq [test_line]
    end
  end
  it 'is the same line if it has the same color' do
   test_line1 = Lines.new('Red')
   test_line2 = Lines.new('Red')
   test_line1.should eq test_line2
  end
end
