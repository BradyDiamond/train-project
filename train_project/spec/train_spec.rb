require 'spec_helper'

describe '#train' do

    before(:each) do 
      @city = City.new(({:name => "Portland",:id => nil}))
      @city.save()
    end

    describe('.find_by_city') do
      it("finds trains for an city") do
        city2 = City.new({:name => "Portland",:id => nil})
        city2.save
        train = Train.new({:name => "Blue",:city_id => @city.id, :id => nil})
        train.save()
        train2 = Train.new({:name => "Thomas",:city_id => city2.id ,:id => nil})
        train2.save()
        expect(Train.find_by_city(city2.id)).to(eq([train2]))
      end
    end

    describe('#==') do 
      it("is the same train if it has the same attributes as another train") do
        train = Train.new({:name => "Blue",:city_id => @city.id, :id => nil})
        train2 = Train.new({:name => "Blue",:city_id => @city.id, :id => nil})
        expect(train).to(eq(train2))
    end
  end

  describe('.all') do
    it("returns a list of all trains") do
      train = Train.new({:name => "Blue",:city_id => @city.id, :id => nil})
      train.save()
      train2 = Train.new({:name => "Thomas",:city_id => city2.id ,:id => nil})
      train2.save()
      expect(Train.all).to(eq([train, train2]))
    end
  end

  describe('.clear') do
    it("clears all trains") do
      train = Train.new({:name => "Blue",:city_id => @city.id, :id => nil})
      train.save()
      train2 = Train.new({:name => "Thomas",:city_id => city2.id ,:id => nil})
      train2.save()
      train.clear()
      expect(Train.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a train") do
      train = Train.new({:name => "Blue",:city_id => @city.id, :id => nil})
      train.save()
      expect(Train.all).to(eq([train]))
    end
  end

  describe('.find') do
    it("finds a train by id") do
      train = Train.new({:name => "Blue",:city_id => @city.id, :id => nil})
      train.save()
      train2 = Train.new({:name => "Thomas",:city_id => city2.id ,:id => nil})
      train2.save()
      expect(Train.find(train.id)).to(eq(train))
    end
  end

  describe('#update') do
    it("updates an train by id") do
      train = Train.new({:name => "Blue",:city_id => @city.id, :id => nil})
      train.save()
      train.update("Mr. P.C.", @city.id)
      expect(train.name).to(eq("Mr. P.C."))
    end
  end

  describe('#delete') do
    it("deletes an train by id") do
      train = Train.new({:name => "Blue",:city_id => @city.id, :id => nil})
      train.save()
      train2 = Train.new({:name => "Thomas",:city_id => city2.id ,:id => nil})
      train2.save()
      train.delete()
      expect(Train.all).to(eq([train2]))
    end
  end
  describe('#city') do
    it("finds the city a train belongs to") do
      train = train.new({:name => "Blue",:city_id => @city.id, :id => nil})
      train.save()
      expect(train.city()).to(eq(@city))
    end
  end
end