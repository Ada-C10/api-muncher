class Recipe
  attr_reader :label, :image, :source, :url, :ingredients, :diet_labels, :health_labels

  def initialize(label, options={})
    raise ArgumentError if label == nil || label == ""

    @label = label

    @image = options[:image]
    @source = options[:source]
    @url = options[:url]
    @ingredients = options[:ingredients]
    @calories = options[:calories]
    @dietlabels = options[:diet_labels]
    @healthlabels = options[:health_labels]
  end


  # def list_diet_labels
  # end
  #
  # def list_health_labels
  # end


end
