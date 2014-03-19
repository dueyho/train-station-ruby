class Stops

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def id
    @id
  end

 def self.all
  results = DB.exec("SELECT * FROM stops;")
  stops = []
  results.each do |result|
    name = result['name']
    id = result['id'].to_i
    stops << Stops.new(name)
  end
  stops.each do |stop|
    puts stop.id.to_s + stop.name.to_s
  end
 end

 def save
  results = DB.exec("INSERT INTO stops (name) VALUES ('#{@name}') RETURNING id;")
  @id = results.first['id'].to_i
 end

 def ==(another_stop)
  self.name == another_stop.name
 end
end

