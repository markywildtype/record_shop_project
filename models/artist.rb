require_relative('../db/sql_runner.rb')
require_relative('album.rb')
require_relative('genre.rb')

class Artist

  attr_reader :id
  attr_accessor :name, :type, :genre, :photo, :link

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @genre = options['genre']
    @photo = options['photo']
    @link = options['link']
  end

  def save()
    sql = 'INSERT INTO artists (name, type, genre, photo, link)
    VALUES ($1, $2, $3, $4, $5)
    RETURNING *;'
    values = [@name, @type, @genre, @photo, @link]
    saved_artist = SqlRunner.run(sql, values)
    @id = saved_artist[0]['id'].to_i
  end

  def find_albums()
    sql = 'SELECT * FROM albums WHERE artist_id = $1 ORDER BY release_date'
    values = [@id]
    artist_album_array = SqlRunner.run(sql, values)
    artist_albums = artist_album_array.map {|artist_album| Album.new(artist_album)}
    return artist_albums
  end

  def update()
    sql = 'UPDATE artists SET (name, type, genre, photo, link)
    = ($1, $2, $3, $4, $5)
    WHERE id = $6;'
    values = [@name, @type, @genre, @photo, @link, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM artists ORDER BY name;"
    all_artists_array = SqlRunner.run(sql)
    all_artists = all_artists_array.map {|artist| Artist.new(artist)}
    return all_artists
  end

  def self.find(id)
    sql = 'SELECT * FROM artists
    WHERE id = $1;'
    values = [id]
    found_artist_array = SqlRunner.run(sql, values).first()
    found_artist = Artist.new(found_artist_array)
    return found_artist
  end

  def self.delete_all()
    sql = 'DELETE FROM artists;'
    SqlRunner.run(sql)
  end

end
