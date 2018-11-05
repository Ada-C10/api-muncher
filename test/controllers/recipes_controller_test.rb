require "test_helper"

describe RecipesController do
  describe 'index' do
    it 'can get a list of recipes' do
      VCR.use_cassette('list_quinoia_recipes') do
        get recipes_path, params: {search_term: 'quinoa'}
        must_respond_with :success
      end
    end

    it 'will show failure flash message if no recipes are found' do
      VCR.use_cassette('list_no_recipes') do
        get recipes_path, params: {search_term: nil}
        must_respond_with :redirect
        expect(flash[:status]).must_equal :failure
      end
    end

  end

  describe 'show' do
    it 'shows a single recipe details page' do
      VCR.use_cassette('show_single_recipe') do
        get recipe_path('recipe_186eac9959d3fc7e9415107ee77a1e2c')
        must_respond_with :success
      end
    end

    it 'will show failure flash message if single recipe is not found' do

      VCR.use_cassette('show_single_recipe_not_found') do
        get recipe_path('nope')
        must_respond_with :redirect
        expect(flash[:status]).must_equal :failure
      end
    end
  end

  # describe 'searcher' do
  # end

end
