require 'httparty'
require 'pry'


class Recipe

  attr_reader :label, :uri, :image, :ingredients, :healthlabel, :dietlabel, :id, :url

  def initialize(label, uri, url, image, ingredientLines, dietLabels)

    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

    @label = label
    @id = uri

    @url = url
    @image = image
    @ingredientLines = ingredientLines
    @dietLabels = dietLabels

  end
end
