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
  @bands = Band.all()
  @venues = Venue.all()
  @band = Band.new({:name => name})
  if @band.save
    erb(:bands)
  else
    erb(:errors)
  end
end

get('/venues') do
  @venues = Venue.all()
  erb(:venues)
end

post('/venues') do
  name = params.fetch('name')
  @venues = Venue.all()
  @bands = Band.all()
  @venue = Venue.new({:name => name})
  if @venue.save
    erb(:venues)
  else
    erb(:errors)
  end
end

get('/bands/:id') do
  @band = Band.find(params.fetch('id').to_i())
  @venues = Venue.all()
  erb(:band_info)
end

patch('/bands/:id') do
  band_id = params.fetch('id').to_i()
  @band = Band.find(band_id)
  venue_ids = params.fetch('venue_ids')
  @band.update({:venue_ids => venue_ids})
  @venues = Venue.all()
  erb(:band_info)
end

get('/venues/:id') do
  @venue = Venue.find(params.fetch('id').to_i())
  @bands = Band.all()
  erb(:venue_info)
end

patch('/venues/:id') do
  venue_id = params.fetch('id').to_i()
  @venue = Venue.find(venue_id)
  band_ids = params.fetch('band_ids')
  @venue.update({:band_ids => band_ids})
  @bands = Band.all()
  erb(:venue_info)
end
