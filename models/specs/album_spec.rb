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
    assert_equal(2.49, @album1.calculate_profit())
    assert_equal(3.48, @album2.calculate_profit())
  end

  def test_stock_profit()
    assert_equal(37.35, @album1.stock_profit())
    assert_equal(34.8, @album2.stock_profit())
  end

  def test_add_stock
    assert_equal(20, @album1.add_stock(5))
    assert_equal(15, @album2.add_stock(5))
  end

  def test_sell_stock
    assert_equal(11, @album1.sell_stock(4))
    assert_equal(7, @album2.sell_stock(3))
  end

end
