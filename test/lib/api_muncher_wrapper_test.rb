require 'test_helper'

describe ApiMuncherWrapper do

  describe "list recipes" do

    it "returns a valid recipe" do
      VCR.use_cassette("hits") do
        query = "tempeh"
        is_successful = ApiMuncherWrapper.list_recipes(query, 1)
        is_successful.wont_be_nil
      end
    end
  end
end
