class Recipe
  attr_reader :label, :image

  def initialize(label, image, options = {} )
    raise ArgumentError if label == nil || label == "" || image == nil || image == ""

    @label = label
    @image = image

    # @purpose = options[:purpose]
    # @is_archived = options[:is_archived]
    # @is_general = options[:is_archived]
    # @members = options[:members]
  end
end
