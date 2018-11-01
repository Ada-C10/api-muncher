class Recipe
  attr_reader :name, :url, :ingredients_list, :photo


def initialize( name:, url:, ingredients_list:, photo: )
	raise ArgumentError if name == nil || name == ""
  # || id == nil || id == ""


    # QUESTION: add an id (maybe pull from the URI???)

    @name = name
    #@id = id

    @url = url
    @ingredients_list = ingredients_list
    @photo = photo
    # TODO: add dietary info here
  end

end
