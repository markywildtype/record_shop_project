require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id
  attr_accessor :name, :type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
  end

  def save()
    sql = 'INSERT INTO artists (name, type)
    VALUES ($1, $2)
    RETURNING *;'
    values = [@name, @type]
    saved_artist = SqlRunner.run(sql, values)
    @id = saved_artist[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
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
