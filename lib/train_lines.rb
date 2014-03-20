class Lines

  attr_reader :color, :id

  def initialize(attribute)
    @color = attribute['color']
    @id = attribute['id']
  end

   def self.all
    results = DB.exec("SELECT * FROM train_lines;")
    lines = []
    results.each do |result|
      color = result['color']
      id = result['id'].to_i
    lines << Lines.new('color' => color, 'id' => id)
    end
    lines
    # lines.each do |line|
    # puts line.id.to_s + line.color.to_s
    # end
  end

  def save
    results = DB.exec("INSERT INTO train_lines (color) VALUES ('#{@color}') RETURNING id;")
    @id = results.first['id'].to_i
  end

   def ==(another_line)
  self.color == another_line.color
 end
end
