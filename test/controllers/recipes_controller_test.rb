require "test_helper"

describe RecipesController do
  describe 'index' do
    it 'shows a list of recipes' do
      VCR.use_cassette("list_channels_file") do
        get recipes_path

        must_respond_with :ok
    end
  end
end
