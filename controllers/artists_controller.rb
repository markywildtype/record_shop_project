require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

get('/artists') do
  @artists = Artist.all()
  erb(:"artists/index")
end

get('/artists/:id') do
  @artist = Artist.find(params['id'])
  erb(:"artists/show")
end
