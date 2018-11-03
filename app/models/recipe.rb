class Recipe < ApplicationRecord

  def self.get_uri(url)

    pattern = /recipe_(.*)/

    uri = pattern.match(url)

    return uri[1]

  end


end
