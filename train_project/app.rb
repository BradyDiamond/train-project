require('sinatra')
require('sinatra/reloader')
require('./lib/city')
require('./lib/train')
require('pry')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "train_project"})

get('/trains') do
  @trains = Train.all
  erb(:trains)
end

get('/cities') do
  @cities = City.all
  erb(:destinations)
end