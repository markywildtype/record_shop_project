require('minitest/autorun')
require('minitest/rg')
require_relative('../artist.rb')

class TestArtist < Minitest::Test

  def setup()
    @artist1 = Artist.new({
      'name' => 'Arcane Roots',
      'type' => 'Band'
    })
    @artist2 = Artist.new ({
      'name' => 'Rachel Sermanni',
      'type' => 'Solo artist'
    })
  end

  def test_artist_name()
    assert_equal('Rachel Sermanni', @artist2.name())
  end

end
