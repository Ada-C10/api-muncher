class Recipe
  attr_reader :label, :recipe_uri, :source, :source_uri, :ingredient_lines,
              :image_uri, :recipe_yield, :total_time, :health_labels

  REQUIRED_ARGS = [:label, :recipe_uri, :source, :source_uri, :ingredient_lines]

  def initialize(args, options = {})
    @valid = true

    begin
      REQUIRED_ARGS.each do |attr|
        if args[attr] == nil || args[attr] == ""
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
