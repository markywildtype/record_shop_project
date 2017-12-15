require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id
  attr_accessor :name, :type

  def initialize(options)
    @id = options['id'].to_i
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

  def self.delete_all()
    sql = 'DELETE FROM artists;'
    SqlRunner.run(sql)
  end

end
