require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')
require_relative('../models/genre.rb')
require('pry-byebug')

get('/artists') do
  @artists = Artist.all()
  erb(:"artists/index")
end

get('/artists/new') do
  @genres = Genre.all()
  erb(:"artists/new")
end

post('/artists') do
  Artist.new(params).save()
  redirect to '/artists'
end

get('/artists/:id') do
  @artist = Artist.find(params['id'])
  erb(:"artists/show")
end

get('/artists/:id/edit') do
  @genres = Genre.all()
  @artist = Artist.find(params['id'])
  erb(:"artists/edit")
end

post('/artists/:id') do
  artist = Artist.new(params)
  artist.update()
  redirect to "/artists/#{params['id']}"
end

get('/artists/:id/albums') do
  @artist = Artist.find(params['id'])
  erb(:"artists/show_album")
end

post('/artists/:id/delete') do
  artist = Artist.find(params['id'])
  artist.delete()
  redirect to "/artists"
end
