class Recipe
  attr_reader :name, :image, :source, :url, :yield, :ingredients, :labels, :cautions

  def initialize(info = {})
    raise ArgumentError if info[:name] == nil || info[:name] == ""

    @name = info[:name]
    @image = info[:image]
    @source = info[:source]
    @url = info[:url]
    @yield = info[:yield]
    @ingredients = info[:ingredients]
    @labels = info[:labels]
    @cautions = info[:cautions]

  end
end
