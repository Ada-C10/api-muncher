class Recipe
  attr_reader :label, :image, :ingredientLines, :healthlabel, :dietlabel, :id, :url, :uri


  def initialize(label, uri, url, image, ingredientLines, dietLabels)

    # raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""


    @label = label
    @uri = uri
    @url = url
    @image = image
    @ingredientLines = ingredientLines
    @dietLabels = dietLabels
  end







end
