class Recipe
  attr_reader :label, :image_uri, :source, :source_uri, :recipe_yield, :health_labels, :ingredient_lines, :total_time

  def initialize(args)
    args.each do |arg|
      raise ArgumentError if arg == nil || arg == ""
    end
    
    @label = args[:label]
    @image_uri = args[:image_uri]
    @source = args[:source]
    @source_uri = args[:source_uri]
    @recipe_yield = args[:recipe_yield]
    @health_labels = args[:health_labels]
    @ingredient_lines = args[:ingredient_lines]
    @total_time = args[:total_time]
  end
end
