require_relative('../db/sql_runner.rb')

class Album

  attr_reader :id
  attr_accessor :title, :release_date, :stock

  def initialize(options)
    @id = options['id'].to_i
    @artist_id = options['artist_id'].to_i
    @title = options['title']
    @release_date = options['release_date']
    @stock = options['stock'].to_i
  end

  def save()
    sql = 'INSERT INTO albums (artist_id, title, release_date, stock)
    VALUES ($1, $2, $3, $4)
    RETURNING *;'
    values = [@artist_id, @title, @release_date, @stock]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def delete()
    sql = 'DELETE FROM albums
    WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = 'SELECT * FROM albums;'
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
