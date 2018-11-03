class Recipe
  attr_reader :label, :image, :ingredients, :healthlabel, :dietlabel, :id, :url, :uri


  def initialize(label, uri, url, image, ingredientLines, dietLabels)

    # raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""


    @label = label
    @uri = uri
    @url = url
    @image = image
    @ingredientLines = ingredientLines
    @dietLabels = dietLabels
  end



  # create an instance of the ids
  # used the .slice! to permanantly remove stuff
  # create a constant of what needs to be removed...search in postman and grab actual url before the uri
  # eliminate one of the helper methods



end
