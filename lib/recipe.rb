class Recipe

  attr_reader :label, :photo, :uri, :ingredients, :dietary_information, :link

  def initialize(label, photo, uri, options = {} )
    raise ArgumentError if label == nil || label == "" || photo == nil || photo == "" || uri == nil || uri == "" || link == nil || link == ""
    @label = label
    @photo = photo
    @uri = uri
    @ingredients = options[:ingredients]
    @dietary_information = options[:dietary_information]
    @link = options[:link]
  end

  endend
