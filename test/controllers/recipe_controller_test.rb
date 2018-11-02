require 'test_helper'

class RecipeControllerTest < ActionDispatch::IntegrationTest
  describe WorksController do

    describe "index" do
      it "succeeds when there are no recipes" do
        get root_path

        must_respond_with :success
      end

      let (:params) do
      {
        params: {
          title: 'Dune',
          creator: 'Frank Herbert',
          description: 'Fear is the mind killer!',
          publication_year: 1963,
          category: INVALID_CATEGORIES.last
        }
      }
      it "succeeds in returning recipes" do
        get root
      end

    end

  end
