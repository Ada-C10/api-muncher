class Recipe
attr_reader :label, :ingredients, :dietaryinformation, :image_url, :recipe_url, :uri, :id

def initialize(label, uri, image_url, recipe_url, dietaryinformation, ingredients)
  raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

  @label = label
  @id = get_id(uri)
  @uri = uri
  @image_url= image_url
  @recipe_url = recipe_url
  @dietaryinformation = dietaryinformation
  @ingredients = ingredients
end

def get_id(uri)
  uri.split("recipe_").last
end

end
