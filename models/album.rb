require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album

  attr_reader :id, :artist_id, :unit_price
  attr_accessor :title, :release_date, :stock, :album_cover

  def initialize(options)
    @id = options['id'].to_i
    @artist_id = options['artist_id'].to_i
    @title = options['title']
    @release_date = options['release_date']
    @unit_price = options['unit_price'].to_f
    @stock = options['stock'].to_i
    @album_cover = options['album_cover']
  end

  def save()
    sql = 'INSERT INTO albums (artist_id, title, release_date, unit_price, stock, album_cover)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING *;'
    values = [@artist_id, @title, @release_date, @unit_price, @stock, @album_cover]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def find_artist()
    sql = "SELECT * FROM artists
    WHERE id = $1;"
    values = [@artist_id]
    album_artist_array = SqlRunner.run(sql, values)
    return album_artist_array[0]
  end

  def update()
    sql = "UPDATE albums SET (artist_id, title, release_date, stock, album_cover)
    = ($1, $2, $3, $4, $5)
    WHERE id = $6"
    values = [@artist_id, @title, @release_date, @stock, @album_cover, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM albums
    WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = 'SELECT albums.*, artists.name FROM albums
    INNER JOIN artists
    ON artists.id = albums.artist_id
    ORDER BY artists.name;'
    all_albums_array = SqlRunner.run(sql)
    all_albums = all_albums_array.map {|album| Album.new(album)}
    return all_albums
  end

  def self.find(id)
    sql = 'SELECT * FROM albums
    WHERE id = $1;'
    values = [id]
    found_albums_array = SqlRunner.run(sql, values).first()
    found_album = Album.new(found_albums_array)
    return found_album
  end

  def self.delete_all()
    sql = 'DELETE FROM albums;'
    SqlRunner.run(sql)
  end

end
