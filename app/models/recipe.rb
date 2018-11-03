class Recipe < ApplicationRecord

  def get_uri(url)

    pattern = /recipe_(.*)/

    uri = pattern.match(url)

    return uri[1]

  end


end
