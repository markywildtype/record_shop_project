require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Arcane Roots',
  'type' => 'Band'
  })

artist2 = Artist.new({
  'name' => 'Black Peaks',
  'type' => 'Band'
  })

artist3 = Artist.new({
  'name' => 'Rachel Sermanni',
  'type' => 'Solo Artist'
  })

artist4 = Artist.new({
  'name' => 'Big Thief',
  'type' => 'Band'
  })

artist1.save()
artist2.save()
artist3.save()
artist4.save()

album1 = Album.new({
  'artist_id' => artist1.id(),
  'title' => 'Melancholia Hymns',
  'release_date' => '2017-09-15',
  'stock' => 15
  })

album2 = Album.new({
  'artist_id' => artist1.id(),
  'title' => 'Blood and Chemistry',
  'release_date' => '2013-05-06',
  'stock' => 10
  })

album3 = Album.new({
  'artist_id' => artist2.id(),
  'title' => 'Statues',
  'release_date' => '2016-04-08',
  'stock' => 12
  })

album4 = Album.new({
  'artist_id' => artist3.id(),
  'title' => 'Under Mountains',
  'release_date' => '2012-09-12',
  'stock' => 5
  })

album5 = Album.new({
  'artist_id' => artist3.id(),
  'title' => 'Tied to the Moon',
  'release_date' => '2015-07-10',
  'stock' => 8
  })

album6 = Album.new({
  'artist_id' => artist4.id(),
  'title' => 'Masterpiece',
  'release_date' => '2016-05-27',
  'stock' => 2
  })

album1.save()
album2.save()
album3.save()
album4.save()
album5.save()
album6.save()

binding.pry
nil
