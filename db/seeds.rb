require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Arcane Roots',
  'type' => 'Band',
  'genre' => 'Alternative Rock',
  'photo' => 'http://bit.ly/2CFjTUQ',
  'link' => 'https://arcaneroots.com/'
  })

artist2 = Artist.new({
  'name' => 'Black Peaks',
  'type' => 'Band',
  'genre' => 'Alternative Rock',
  'photo' => 'http://bit.ly/2BfqR6V',
  'link' => 'http://www.blackpeaks.com/'
  })

artist3 = Artist.new({
  'name' => 'Rachel Sermanni',
  'type' => 'Solo Artist',
  'genre' => 'Folk',
  'photo' => 'http://bit.ly/2kjRCfA',
  'link' => 'http://rachelsermanni.co.uk/'
  })

artist4 = Artist.new({
  'name' => 'Big Thief',
  'type' => 'Band',
  'genre' => 'Alternative Rock',
  'photo' => 'http://bit.ly/2yWQFi7',
  'link' => 'http://www.bigthief.net/'
  })

artist1.save()
artist2.save()
artist3.save()
artist4.save()

album1 = Album.new({
  'artist_id' => artist1.id(),
  'title' => 'Melancholia Hymns',
  'release_date' => '2017-09-15',
  'unit_price' => 8.50,
  'sale_price' => 10.99,
  'stock' => 15,
  'album_cover' => 'http://bit.ly/2oIlAyw'
  })

album2 = Album.new({
  'artist_id' => artist1.id(),
  'title' => 'Blood and Chemistry',
  'release_date' => '2013-05-06',
  'unit_price' => 8.50,
  'sale_price' => 9.99,
  'stock' => 10,
  'album_cover' => 'http://bit.ly/2CCncw3'
  })

album3 = Album.new({
  'artist_id' => artist2.id(),
  'title' => 'Statues',
  'release_date' => '2016-04-08',
  'unit_price' => 7.50,
  'sale_price' => 11.99,
  'stock' => 12,
  'album_cover' => 'http://bit.ly/2D5pnJu'
  })

album4 = Album.new({
  'artist_id' => artist3.id(),
  'title' => 'Under Mountains',
  'release_date' => '2012-09-12',
  'unit_price' => 5.51,
  'sale_price' => 8.99,
  'stock' => 5,
  'album_cover' => 'http://bit.ly/2AY3JW1'
  })

album5 = Album.new({
  'artist_id' => artist3.id(),
  'title' => 'Tied to the Moon',
  'release_date' => '2015-07-10',
  'unit_price' => 5.51,
  'sale_price' => 8.99,
  'stock' => 8,
  'album_cover' => 'http://bit.ly/2D3XpxP'
  })

album6 = Album.new({
  'artist_id' => artist4.id(),
  'title' => 'Masterpiece',
  'release_date' => '2016-05-27',
  'unit_price' => 6.55,
  'sale_price' => 12.99,
  'stock' => 2,
  'album_cover' => 'http://bit.ly/2BLTFmQ'
  })

album1.save()
album2.save()
album3.save()
album4.save()
album5.save()
album6.save()

binding.pry
nil
