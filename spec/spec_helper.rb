require 'rspec'
require 'pg'
require 'stops'
require 'stations'
require 'train_lines'


DB = PG.connect(:dbname => 'train_system_test')

RSpec.configure do |config|
  config.after (:each) do
    DB.exec('DELETE FROM stops *;')

  end
end
