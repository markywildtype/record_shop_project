require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

get('/albums') do
  @albums = Album.all()
  erb(:"albums/index")
end

get('/albums/new') do
  @artists = Artist.all()
  erb(:"albums/new")
end

get('/albums/:id') do
  @album = Album.find(params['id'])
  erb(:"albums/show")
end
