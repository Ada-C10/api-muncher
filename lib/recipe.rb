require 'httparty'

class Recipe
  # Mixin - Can now do get/post requests like you would with httparty.
  # Could just type in the HTTParty
  # include HTTParty
  # format :json
  # base_uri ''

  attr_reader :name, :image, :uri, :url, :ingredients, :dietLabels
  attr_accessor :id

  def initialize(label, image, uri, url, ingredients, id, dietLabels: [])

    raise ArgumentError if label == nil || label.empty?
    raise ArgumentError if image == nil || image.empty?
    raise ArgumentError if uri == nil || uri.empty?
    raise ArgumentError if url == nil || url.empty?
    raise ArgumentError if ingredients == nil || ingredients.empty?

    @name = label
    @image = image
    @uri = uri
    @url = url
    @ingredients = ingredients
    @id = ( URI.encode( @uri ) )[/[^_]+$/]
    @dietLabels = dietLabels

  end


end
