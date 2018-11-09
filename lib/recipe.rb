require 'httparty'



class Recipe

  attr_reader :label, :id, :image, :ingredient_lines, :diet_labels, :url

  def initialize(label, uri, url, image, ingredientLines, dietLabels)

    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

    @label = label
    @id = uri

    @url = url
    @image = image
    @ingredient_lines = ingredientLines
    @diet_labels = dietLabels

  end
end
