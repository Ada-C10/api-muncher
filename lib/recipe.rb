class Recipe
  attr_reader :name, :url, :ingredients_list, :dietary_info, :health_info, :photo, :uri_num


def initialize( name:"", url:"", ingredients_list:"", dietary_info:"", health_info:"", photo:"", uri_num:"" )
	raise ArgumentError if name == nil || name == "" || uri_num == nil || uri_num == "" || url == nil || url == ""


    @name = name
    @url = url
    @ingredients_list = ingredients_list
    @dietary_info = dietary_info
    @health_info = health_info
    @photo = photo
    @uri_num = convert_uri_to_num(uri_num)
    # TODO: add dietary info here
  end

  private

  def convert_uri_to_num(uri)
    pattern = /#(.+)\z/
    short_uri = uri[pattern]
    shorter_uri = short_uri[1..-1] #eh, don't want the '#'

    return shorter_uri
  end

end
