class Details

  attr_accessor :name, :title

  def initialize(options)
    @name = options['name']
    @title = options['title']
  end

end