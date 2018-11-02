class Recipe
  attr_reader :name, :url, :ingredients_list, :photo, :uri_num


def initialize( name:, url:, ingredients_list:, photo:, uri_num: )
	raise ArgumentError if name == nil || name == ""
  # || id == nil || id == ""


    # QUESTION: add an id (maybe pull from the URI???)

    @name = name
    #@id = id

    @url = url

    @ingredients_list = ingredients_list
    @photo = photo
    @uri_num = convert_uri_to_num(uri_num)
    # TODO: add dietary info here
  end

  def convert_uri_to_num(uri)
    pattern = /#(.+)\z/
    short_uri = uri[pattern]
    shorter_uri = short_uri[1..-1] #eh, don't want the '#'

    return shorter_uri
  end

end
