require "test_helper"

describe SearchRecipesController do

  it 'can get the new search form' do
    VCR.use_cassette('search-form-file') do
      get root_path

      must_respond_with :ok
    end
  end


  it 'can view the index page' do
    VCR.use_cassette('find_recipes_file') do
      get search_recipes_path, params: {
        search: 'chicken'
      }

      must_respond_with :ok
    end
  end


  it 'displays a flash message if there were no recipes found for search input' do
    VCR.use_cassette('no-recipes-file') do

      get search_recipes_path, params: {
        search: 'zqb'
      }

      expect(flash[:result_text]).must_equal "Sorry, no recipes were found for your request"
      must_redirect_to(root_path)
    end

  end

  it 'renders new form and responds with 400 bad request if params search is nil' do

    VCR.use_cassette('find_recipes_file') do
      get search_recipes_path, params: {
        search: nil
      }

      expect(flash[:result_text]).must_equal 'Search input cannot be blank'
      must_respond_with :bad_request
    end

  end

  it 'renders new form and responds with 400 bad request if params search is an empty string' do

    VCR.use_cassette('find_recipes_file') do
      get search_recipes_path, params: {
        search: ""
      }

      expect(flash[:result_text]).must_equal 'Search input cannot be blank'
      must_respond_with :bad_request
    end

  end

  it 'can view the details page with a valid recipe' do
    VCR.use_cassette('find_recipes_file') do
      uri = URI("http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2")
      parsed_id = uri.fragment

      get search_recipe_path(parsed_id)

      must_respond_with :ok
    end
  end

  it 'displays a flash message if it\'s an invalid recipe id' do
    VCR.use_cassette('no_recipe_file') do
      uri = URI("http://www.edamam.com/ontologies/edamam.owl#recipe_222222222222222222222222222")
      parsed_id = uri.fragment

      get search_recipe_path(parsed_id)

      expect(flash[:result_text]).must_equal "This recipe does not exist. Please try again."
      must_redirect_to root_path
    end

  end



end
