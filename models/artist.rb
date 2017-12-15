class Artist

  attr_reader :id
  attr_accessor :name, :type

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @type = options['type']
  end

end
