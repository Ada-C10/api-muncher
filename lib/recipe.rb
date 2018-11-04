class Recipe

  attr_reader :name, :ingredients, :dietary_info, :url, :uri, :health_info, :image_url

  def initialize(name, options = {} )
    raise ArgumentError if name == nil || name == ""
    @name = name
    @ingredients = options[:ingredients] || default_empty_list
    @uri = options[:uri] || default_empty_string
    @url = options[:url] || default_empty_string
    @dietary_info = options[:dietary_info] || default_empty_list
    @image_url = options[:image_url] || default_missing_image
    @health_info = options[:health_info] || default_empty_list
  end

  private

  def default_empty_list
    ["N/A"]
  end

  def default_empty_string
    ""
  end

  def default_missing_image
    "http://vyfhealth.com/wp-content/uploads/2015/10/yoga-placeholder1.jpg"
  end
end
