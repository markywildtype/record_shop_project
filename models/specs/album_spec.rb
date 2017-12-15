require('minitest/autorun')
require('minitest/rg')
require_relative('../album.rb')

class TestAlbum < Minitest::Test

  def setup()
    @album1 = Album.new ({
      'title' => 'Melancholia Hymns',
      'release_date' => '13/09/17',
      'stock' => 15
      })

  @album2 = Album.new ({
    'title' => 'Under Mountains',
    'release_date' => '12/04/13',
    'stock' => 10
    })
  end

  def test_album_title()
    assert_equal('Melancholia Hymns', @album1.title())
    assert_equal('Under Mountains', @album2.title())
  end

end
