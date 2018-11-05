require "test_helper"

describe RecipesController do
  describe "index and show" do
    it 'root page is the new search page' do
      get root_path

      must_respond_with :ok
    end

    it 'should respond with a success ok for getting recipe list' do
      get recipe_index_path(params[:word])

      must_respond_with :ok

    end

    it 'should respond with a success ok for getting details of a recipe' do
      get recipe_detail_path(params[:word])

      must_respond_with :ok

    end


  end
end
