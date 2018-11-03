class Recipe
  attr_reader :name, :id, :source, :image, :source_url

  def initialize(args)
    # raise ArgumentError if name == nil || name == "" || id == nil || id == ""
    @id = args["uri"]
    @name = args["label"]
    @source = args["source"]
    # @ingredients =
    # @dietary
    @image = args["image"]
    @source_url = args["url"]
  end
end
