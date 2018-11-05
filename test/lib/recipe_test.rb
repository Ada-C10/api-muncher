#require 'test_helper'

describe Recipe do
  let(:recipe_hash) {{
    name: 'very good recipe yeah',
    uri_num: "http://www.edamam.com/ontologies/edamam.owl#recipe_186eac9959d3fc7e9415107ee77a1e2c",
    url: "http://norecipes.com/recipe/baked-beans/"
    }}
    let(:recipe) {Recipe.new(
      name: recipe_hash[:name],
      uri_num: recipe_hash[:uri_num],
      url: recipe_hash[:url]
      )}

      describe 'init' do
        it 'can create new Recipe instance using name, uri_num, and url' do
          expect(recipe).must_be_instance_of Recipe
        end

        it 'will raise an ArgumentError if name is nil or blank' do

          expect {
            Recipe.new(
              name: nil,
              uri_num: recipe_hash[:uri_num],
              url: recipe_hash[:url]
            ).must_raise ArgumentError
          }

          expect {
            Recipe.new(
              name: "",
              uri_num: recipe_hash[:uri_num],
              url: recipe_hash[:url]
            ).must_raise ArgumentError
          }
        end

        it 'will raise an ArgumentError if uri_num is nil or blank' do

          expect {
            Recipe.new(
              name: recipe_hash[:name],
              uri_num: nil,
              url: recipe_hash[:url]
            ).must_raise ArgumentError
          }

          expect {
            Recipe.new(
              name: recipe_hash[:name],
              uri_num: "",
              url: recipe_hash[:url]
            ).must_raise ArgumentError
          }
        end

        it 'will raise an ArgumentError if url is nil or blank' do

          expect {
            Recipe.new(
              name: recipe_hash[:name],
              uri_num: recipe_hash[:uri_num],
              url: nil
            ).must_raise ArgumentError
          }

          expect {
            Recipe.new(
              name: recipe_hash[:name],
              uri_num: recipe_hash[:uri_num],
              url: ""
            ).must_raise ArgumentError
          }
        end
      end

    #   describe 'convert_uri_to_num' do
    #     it 'can convert the uri to a shorter version' do
    #     uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_186eac9959d3fc7e9415107ee77a1e2c"
    #
    #     target_uri_num = "recipe_186eac9959d3fc7e9415107ee77a1e2c"
    #
    #     uri_num = Recipe.convert_uri_to_num(uri)
    #
    #     expect(uri_num).must_equal target_uri_num
    #   end
    # end
  end
