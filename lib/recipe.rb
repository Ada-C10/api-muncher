class Recipe
  attr_reader :label, :recipe_uri, :source, :source_uri, :ingredient_lines,
              :image_uri, :recipe_yield, :total_time, :health_labels

  def initialize(args, options = {})
    @valid = true

    begin
      args.each do |key, value|
        if value == nil || value == ""
          raise ArgumentError
        end
      end
    rescue
      return @valid = false
    end

    @label = args[:label]
    @recipe_uri = args[:recipe_uri]
    @source = args[:source]
    @source_uri = args[:source_uri]
    @ingredient_lines = args[:ingredient_lines]

    @image_uri = options[:image_uri]
    @recipe_yield = options[:recipe_yield]
    @total_time = options[:total_time]
    @health_labels = options[:health_labels]
  end

  def valid?
    return @valid
  end
end
