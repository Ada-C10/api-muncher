class Recipe
  attr_reader :label, :image, :uri

  def initialize(name, image, uri, options = {})
    
    raise ArgumentError if name == nil || name.empty?
    raise ArgumentError if image == nil || image.empty?
    raise ArgumentError if uri == nil || uri.empty?

    @name = label
    @image = image
    @uid = uid


    # options here

  end


end
