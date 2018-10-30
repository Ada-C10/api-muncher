class Recipe
  attr_reader :name, :id

  def initialize(name, options = {})
    raise ArgumentError if name == nil || name.empty?
    @name = name
    @id = id

    # options here 

  end


end
