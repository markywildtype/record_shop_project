require('sinatra')
require('sinatra/contrib/all')
require_relative('models/artist.rb')
require_relative('models/album.rb')

get('/artists') do
  @artists = Artist.all()
  erb(:index)
end
