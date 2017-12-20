require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

get '/stock' do
  @albums = Album.all()
  erb(:"stock/index")
end
