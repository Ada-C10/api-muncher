class Recipe
  attr_reader :id, :name, :photo, :original_recipe, :ingredients, :diet_labels, :source

  def initialize(uri, name, options = {})
    raise ArgumentError if name == nil || name == "" || uri == nil || uri == ""

    @id = uri
    @name = name
    
    @photo = options[:photo]
    @original_recipe = options[:org_recipe]
    @ingredients = options[:ingredients]
    @diet_labels = options[:diet_labels]
    @source = options[:source]
  end
end
