require "test_helper"

describe RecipesController do
  it 'can get the root path and search form' do
    get root_path
    must_respond_with :ok
  end

  it 'can get the index path and perform search' do
    VCR.use_cassette("recipes") do
      get recipes_path("chicken")
      must_respond_with :ok
    end
  end

  it 'can get the show path for valid id' do
    VCR.use_cassette("recipes") do
      valid_id = "888e9fc4a808e9e4ccdb2ac24a6a2f46"
      get recipe_path(valid_id)
      must_respond_with :ok
    end
  end

  it 'calls render_404 if recipe id is invalid' do
    VCR.use_cassette("recipes") do
      invalid_id = "123"
      expect {
        get recipe_path(invalid_id)
      }.must_raise(ActionController::RoutingError)
    end
  end
end
