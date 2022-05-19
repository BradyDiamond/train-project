require 'rspec'
require 'pg'
require 'city'
require 'train'
# require 'artist'
require 'pry'

DB = PG.connect({:dbname => 'train_project', :password => 'epicodus'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM cities *;")
    DB.exec("DELETE FROM trains *;")
    DB.exec("DELETE FROM stops *;")
  end
end