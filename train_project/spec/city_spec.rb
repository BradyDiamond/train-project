require 'spec_helper'

describe('#City') do

  describe('.all') do
    it("returns an empty array when there are no cities") do
      expect(City.all).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same cities if it has the same attributes as another city') do
      city = City.new({:name => 'Portland', :id => nil})
      city2 = City.new({:name => 'Portland', :id => nil})
      expect(city).to(eq(city2))
    end
  end


  describe('#save') do
    it("saves a city") do
      city = City.new({:name => 'Portland', :id => nil})
      city.save()
      city2 = City.new({:name => 'Miami', :id => nil})
      city2.save()
      expect(City.all).to(eq([city, city2]))
    end
  end

  describe('.clear') do
    it('clears all cities') do
      city = City.new({:name => 'Miami', :id => nil})
      city.save()
      city2 = City.new({:name => 'Las Vegas', :id => nil})
      city2.save()
      City.clear()
      expect(City.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a city by id") do
      city = City.new({:name => 'Portland', :id => nil})
      city.save()
      city2 = City.new({:name => 'New York', :id => nil})
      city2.save()
      expect(City.find(city.id)).to(eq(city))
    end
  end

  describe('#update') do
    it("updates a city by id") do
      city = City.new({:name => 'Portland', :id => nil})
      city.save()
      city.update({:name => "Rip City"})
      expect(city.name).to(eq("Rip City"))
    end
  end

  describe('#delete') do
    it("deletes a city by id") do
      city = City.new({:name => 'Portland', :id => nil})
      city.save()
      city2 = City.new({:name => 'Miami', :id => nil})
      city2.save()
      city2.delete()
      expect(City.all).to(eq([city]))
    end
    

  #   it("deletes all stops belonging to a deleted city") do
  #     city = City.new({:name => "Portland", :id => nil})
  #     city.save()
  #     train = Train.new({:name => "Blue", :city_id => city.id, :id => nil})
  #     train.save()
  #     city.delete()
  #     expect(Train.find(train.id)).to(eq(nil))
  #   end
  end

  # describe('.search') do
  #   it('provides a city with the given name') do
  #     city = City.new({:name => 'Portland', :id => nil})
  #     city.save()
  #     city2 = City.new({:name => 'Miami', :id => nil})
  #     city2.save()
  #     expect(City.search('Portland')).to(eq([city]))
  #   end
  # end

  # describe('.sort') do
  #   it('sorts cities by the name') do
  #     city = City.new({:name => 'Reno', :id => nil})
  #     city.save()
  #     city2 = City.new({:name => 'Boston', :id => nil})
  #     city2.save()
  #     city3 = City.new({:name => 'Denver', :id => nil})
  #     city3.save()
  #     expect(City.sort('name')).to(eq([city2, city3, city]))
  #   end
  # end
end