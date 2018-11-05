require 'httparty'

class UnsplashWrapper
  BASE = "https://api.unsplash.com/search/photos?query="
  ID = "&client_id=cb149b98b1efbc1c84b7ecd45cee97f6db26af9bd7b7d6612cbdbc7d5f30d57e&orientation=landscape&per_page=50"

  def self.image(queery, sample = false)

    url = BASE + queery + ID
    data = HTTParty.get(url)

    if data["results"].empty?
      return "".html_safe
    end

    if sample
      sample = data["results"].sample
      return sample["urls"]["full"].html_safe
    else
      return data["results"][0]["urls"]["full"].html_safe
    end
  end
end
