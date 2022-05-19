class Stop
  attr_reader :id
  attr_accessor :time, :city_id, :train_id, :id

  def initialize(attributes)
    @stop = attributes.fetch(:time)
    @id = attributes.fetch(:id)
    @train_id = attributes.fetch(:train_id)
    @city_id = attributes.fetch(:city_id)
  end

  def ==(stop_to_compare)
    if stop_to_compare != nil
      (self.time()== stop_to_compare.time()) && (self.train_id() == stop_to_compare.train_id())
    else
      false
    end
  end

  def self.all 
    returned_stops = DB.exec("SELECT * FROM stops;")
    stops = []
    returned_stops.each() do |stop|
      time = stop.fetch("time")
      city_id = stop.fetch("city_id").to_i
      train_id = stop.fetch("train_id").to_i
      id = stop.fetch("id").to_i
      stops.push(Stop.new({:time => time, :city_id => city_id, :train_id => train_id, :id => id}))
    end
    stops
  end

  def save
    result = DB.exec("INSERT INTO stops (time, city_id, train_id) VALUES('#{@name}', #{@city_id}, #{train_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    stop = DB.exec("SELECT * FROM stops WHERE id = #{id};").first
    time = stop.fetch("time")
    train_id = stop.fetch("train_id").to_i
    city_id = stop.fetch("city_id").to_i
    id = stop.fetch("id").to_i
    Stop.new({:time => time, :train_id => train_id, :city_id => city_id, :id => id })
  end

  def update(stop, train_id, city_id)
    @stop = stop
    @train_id = train_id
    @city_id = city_id
    DB.exec("UPDATE stop SET stop = '#{@name}', train_id = #{@train_id}, city_id = #{@city_id} WHERE id = #{id};")
  end

  def self.clear
    DB.exec("DELETE FROM *;")
  end

  def self.find_by_stop(cit_id, trn_id)
    stops = []
    returned_stops = DB.exec("SELECT * FROM stops WHERE city_id = #{cit_id}, train_id = #{trn_id} ;")
    returned_stops.each do |stop|
      time = stop.fetch('time')
      id = stop.fetch('id').to_i
      stops.push(Stop.new({:time => time, :train_id => train_id, :city_id => city_id, :id => id }))
    end
    stops
  end

  def city 
    City.find(@city_id)
  end

  def train
    Train.find(@train_id)
  end
end

