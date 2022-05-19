class Train
  attr_reader :id
  attr_accessor :name, :city_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @city_id = attributes.fetch(:city_id)
    @id = attributes.fetch(:id)
  end

  def ==(train_to_compare)
    if city_to_compare != nil
      (self.name() == train_to_compare.name()) && (self.city_id() == train_to_compare.city_id())
    else
      false
    end
  end

  def self.all
    returned_trains = DB.exec("SELECT * FROM trains;")
    trains = []
    returned_trains.each() do |train|
      name = train.fetch("name")
      city_id = train.fetch("city_id").to_i
      id = city.fetch("id").to_i
      trains.push(City.new({:name => name, :city_id => city_id, :id => id}))
    end
    trains
  end

  def save
    result = DB.exec("INSERT INTO trains (name, city_id) VALUES ('#{@name}', #{@city_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    train = DB.exec("SELECT * FROM trains  WHERE id = #{id};").first
    name = train.fetch("name")
    city_id = train.fetch("city_id").to_i
    id = train.fetch("id").to_i
    Train.new({:name => name, :city_id => city_id, :id => id})
  end

  def update(name, city_id)
    @name = name
    @city_id = city_id
    DB.exec("UPDATE trains SET name = '#{@name}', city_id = #{@city_id} WHERE id = #{@id};")
  end

  def self.clear
    DB.exec("DELETE FROM trains *;")
  end

  def self.find_by_city(cit_id)
    trains = []
    returned_trains = DB.exec("SELECT * FROM trains WHERE city_id = #{cit_id};")
    returned_trains.each do |train|
      name = train.fetch("name")
      id = train.fetch("id").to_i
      trains.push(Train.new({:name => name, :city_id => cit_id, :id => id}))
    end
    trains
  end
  
  def city
    City.find(@city_id)
  end

  def stop
    Stop.find_by_stop(self.id)
  end
 end