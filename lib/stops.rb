class Stops

  attr_reader :station_id, :line_id, :id

  def initialize(input)
    @id = input['id']
    @line_id = input['line_id']
    @station_id = input['station_id']
  end

  def self.create(hash)
    stop = Stops.new(hash)
    stop.save
    stop
  end


  def self.all
  results = DB.exec("SELECT * FROM stops;")
  stops = []
  results.each do |result|
    stops << Stops.new(result)
  end
 stops
  end

 def save
  results = DB.exec("INSERT INTO stops (station_id, line_id) VALUES ('#{@station_id}', '#{@line_id}') RETURNING id;")
  @id = results.first['id'].to_i
 end

 def ==(another_stop)

  self.station_id.to_i == another_stop.station_id.to_i && self.line_id.to_i == another_stop.line_id.to_i
  end
end


