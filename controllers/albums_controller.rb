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

post('/albums') do
  Album.new(params).save()
  redirect to '/albums'
end

get('/albums/add_stock') do
  @albums = Album.all()
  erb(:"albums/add_stock")
end

post('/albums/add_stock') do
  album = Album.find(params['select'].to_i)
  album.add_stock(params['stock'].to_i)
  album.update
  redirect to "/albums/#{params['select'].to_i}"
end

get('/albums/sell_stock') do
  @albums = Album.all()
  erb(:"albums/sell_stock")
end

post('/albums/sell_stock') do
  album = Album.find(params['select'].to_i)
  if album.stock() >= params['stock'].to_i
    album.sell_stock(params['stock'].to_i)
    album.update()
    redirect to "/albums/#{params['select'].to_i}"
  else
    erb(:"albums/error")
  end
end

get('/albums/:id') do
  @album = Album.find(params['id'])
  erb(:"albums/show")
end

get('/albums/:id/edit') do
  @album = Album.find(params['id'])
  @artists = Artist.all()
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
