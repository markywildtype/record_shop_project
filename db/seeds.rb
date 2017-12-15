require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

# Album.delete_all()
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
      'type' => 'Solo artist'
      })

      artist4 = Artist.new({
        'name' => 'Big Thief',
        'type' => 'Band'
        })

        artist1.save()
        artist2.save()
        artist3.save()
        artist4.save()
#
# album1 = Album.new({
#   'title' => '',
#   'release_date' => '',
#   'stock' =>
#   })
#
# album1 = Album.new({
#   'title' => '',
#   'release_date' => '',
#   'stock' =>
#   })
#
# album1 = Album.new({
#   'title' => '',
#   'release_date' => '',
#   'stock' =>
#   })
#
# album1 = Album.new({
#   'title' => '',
#   'release_date' => '',
#   'stock' =>
#   })



binding.pry
nil
