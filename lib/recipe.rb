class Recipe
  attr_reader :name, :id, :source, :image, :source_url, :ingredients, :dietary

  def initialize(args)
    raise ArgumentError if args["uri"] == nil || args["uri"] == "" || args["label"] == nil || args["label"] == ""

    @id = format_uri(args["uri"])
    @name = args["label"]
    @source = args["source"]
    @ingredients = args["ingredientLines"]
    @dietary = args["healthLabels"]
    @image = args["image"]
    @source_url = args["url"]
  end

  private

  def format_uri(arg)
    arg.slice! "http://www.edamam.com/ontologies/edamam.owl#"
    return arg
  end
end
