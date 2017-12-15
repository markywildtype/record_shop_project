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
    @artist_id = result[0]['artist_id'].to_i
  end

  def self.delete_all()
    sql = 'DELETE FROM albums;'
    SqlRunner.run(sql)
  end

end
