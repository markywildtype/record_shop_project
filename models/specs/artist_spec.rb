require('minitest/autorun')
require('minitest/rg')
require_relative('../artist.rb')

class TestArtist < Minitest::Test

  def setup()
    artist1 = {
      'name' => 'Arcane Roots',
      'type' => 'Band'
    }
    artist2 = {
      'name' => 'Rachel Sermanni',
      'type' => 'Solo artist'
    }
  end

  def test_artist_name()
    assert_equal('Rachel Sermanni', artist2.name())
  end

end
