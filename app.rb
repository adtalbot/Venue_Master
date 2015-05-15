require('bundler/setup')
require('pry')
Bundler.require(:default, :production)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

post('/bands') do
  name = params.fetch('name')
  band = Band.create({:name => name})
  @bands = Band.all()
  erb(:bands)
end

get('/venues') do
  @venues = Venue.all()
  erb(:venues)
end

post('/venues') do
  name = params.fetch('name')
  venue = Venue.create({:name => name})
  @venues = Venue.all()
  erb(:venues)
end

get('/bands/:id') do
  @band = Band.find(params.fetch('id').to_i())
  @venues = Venue.all()
  erb(:band_info)
end

get('/venues/:id') do
  @venue = Venue.find(params.fetch('id').to_i())
  @bands = Band.all()
  erb(:venue_info)
end
