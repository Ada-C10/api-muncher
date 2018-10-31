class Recipe
  attr_reader :label, :recipe_uri, :image_uri, :source, :source_uri, :recipe_yield, :health_labels, :ingredient_lines, :total_time

  def initialize(args)
    args.each do |key, value|
      raise ArgumentError if value == nil || value == "" || value == []
    end

    @label = args[:label]
    @recipe_uri = args[:recipe_uri]
    @image_uri = args[:image_uri]
    @source = args[:source]
    @source_uri = args[:source_uri]
    @recipe_yield = args[:recipe_yield]
    @health_labels = args[:health_labels]
    @ingredient_lines = args[:ingredient_lines]
    @total_time = args[:total_time]
  end
end
