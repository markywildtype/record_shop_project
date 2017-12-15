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

end
