class Recipe
  attr_reader :name, :id, :source, :image, :source_url

  def initialize(args)
    # raise ArgumentError if name == nil || name == "" || id == nil || id == ""
    @id = format_uri(args["uri"])
    @name = args["label"]
    @source = args["source"]
    # @ingredients =
    # @dietary
    @image = args["image"]
    @source_url = args["url"]
  end

  private

  def format_uri(arg)
    arg.slice! "http://www.edamam.com/ontologies/edamam.owl#"
    return arg
  end
end
