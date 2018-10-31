class Recipe
  attr_reader :uri, :label, :image, :source, :url

  def initialize(uri, label, image, source, url)
    raise ArgumentError if label == nil || label == "" || uri == "" || uri == nil

    @uri = uri
    @label = label
    @image = image
    @source = source
    @url = url
    # @healthlabels = healthLabels
    # @cautions = cautions
    
  end
end
