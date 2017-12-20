require('minitest/autorun')
require('minitest/rg')
require_relative('../album.rb')

class TestAlbum < Minitest::Test

  def setup()
    @album1 = Album.new ({
      'title' => 'Melancholia Hymns',
      'release_date' => '13/09/17',
      'unit_price' => 8.50,
      'sale_price' => 10.99,
      'stock' => 15
      })

  @album2 = Album.new ({
    'title' => 'Under Mountains',
    'release_date' => '12/04/13',
    'unit_price' => 5.51,
    'sale_price' => 8.99,
    'stock' => 10
    })
  end

  def test_album_title()
    assert_equal('Melancholia Hymns', @album1.title())
    assert_equal('Under Mountains', @album2.title())
  end

  def test_album_stock()
    assert_equal(15, @album1.stock())
    assert_equal(10, @album2.stock())
  end

  def test_calculate_profit()
    expected1 = 10.99 - 8.50
    expected2 = 8.99 - 5.51
    assert_equal(expected1, @album1.calculate_profit())
    assert_equal(expected2, @album2.calculate_profit())
  end

end
