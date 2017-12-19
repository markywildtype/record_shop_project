require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/type.rb')

get('/albums') do
  @albums = Album.all()
  erb(:"albums/index")
end

get('/albums/new') do
  @artists = Artist.all()
  erb(:"albums/new")
end

post('/albums') do
  Album.new(params).save()
  redirect to '/albums'
end

get('/albums/:id') do
  @album = Album.find(params['id'])
  erb(:"albums/show")
end

get('/albums/:id/edit') do
  @album = Album.find(params['id'])
  @artists = Artist.all()
  @types = Type.all()
  erb(:"albums/edit")
end

post('/albums/:id') do
  album = Album.new(params)
  album.update()
  redirect to "/albums/#{params['id']}"
end

post('/albums/:id/delete') do
  album = Album.find(params['id'])
  album.delete()
  redirect to "/albums"
end
