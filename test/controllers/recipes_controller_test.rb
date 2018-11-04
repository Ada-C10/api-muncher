require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest

  describe 'search' do
    it 'can get the search path' do
      get root_path

      must_respond_with :ok
    end
  end

  describe 'index' do
    it 'can get the a paged list of recipe icons given a valid search' do
      VCR.use_cassette("recipes") do
        flavor = 'mochi'
        search_data = {
          search: flavor
        }

        get recipes_path, params: search_data

        must_respond_with :ok
        session[:search].must_equal flavor
      end
    end

    it 'redirects to the search page if there are no matching recipes' do
      VCR.use_cassette("recipes") do
        flavor = 'asdfqwerty'
        search_data = {
          search: flavor
        }

        get recipes_path, params: search_data

        must_redirect_to root_path
        flash[:result_text].must_equal "No recipes found for #{flavor}"
      end
    end

    it 'redirects to the search page if given invalid search parameters of ""' do
      VCR.use_cassette("recipes") do
        search_data = {
          search: ''
        }

        get recipes_path, params: search_data

        must_redirect_to root_path
        flash[:result_text].must_equal "Please enter a flavor to search"
      end
    end

    it 'redirects to the search page if given invalid search parameters of ""' do
      VCR.use_cassette("recipes") do
        search_data = {
          search: nil
        }

        get recipes_path, params: search_data

        must_redirect_to root_path
        flash[:result_text].must_equal "Please enter a flavor to search"
      end
    end
  end

  describe 'show' do
    it 'can get the detail page for a specific recipe' do
      VCR.use_cassette("recipe") do
        valid_link = "http://www.edamam.com/ontologies/edamam.owl#recipe_ffadcd7a288d105c3767adb7c930bd53"
        search_link = {
          link: valid_link
        }

        get recipe_path, params: search_link

        must_respond_with :ok
      end
    end

    it 'redirects to the root page if the no recipe exists for the given link' do
      VCR.use_cassette("recipe") do
        invalid_link = "http://www.edamam.com/ontologies/edamam.owl#recipe_fakefakefakeffadcd7a288d105c3767adb7c930bd53"
        search_link = {
          link: invalid_link
        }

        get recipe_path, params: search_link

        must_redirect_to root_path
        flash[:result_text].must_equal "Recipe not found"
      end
    end
  end

end
