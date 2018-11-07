require 'test_helper'
describe 'Recipe' do

  it "Cannot be initialized without a name" do
    expect {
      Recipe.new
    }.must_raise ArgumentError
  end

  it "Must initialize name properly" do
    channel = Recipe.new("Name")
    expect(channel.name).wont_be_nil
    expect(channel.name).must_equal "Name"
  end

  it 'must raise error for empty string name' do
    empty_name = ""

    expect{
      Recipe.new(empty_name)
    }.must_raise ArgumentError
  end

  it 'must have default value for options' do
    recipe = Recipe.new("bologne")
    empty_list = ["N/A"]
    empty_string = ""
    missing_image = "http://vyfhealth.com/wp-content/uploads/2015/10/yoga-placeholder1.jpg"

    expect(recipe.ingredients).must_equal empty_list
    expect(recipe.uri).must_equal empty_string
    expect(recipe.url).must_equal empty_string
    expect(recipe.dietary_info).must_equal empty_list
    expect(recipe.health_info).must_equal empty_list
    expect(recipe.image_url).must_equal missing_image
  end

  it 'must be able to populate options' do
    options = {
      ingredients: ["ingredients"],
      uri: ["uri"],
      url: ["url"],
      dietary_info: ["dietary_info"],
      image_url: "image_url",
      health_info: ["health_info"]
    }
    recipe = Recipe.new("bologne", options)

    expect recipe.must_respond_to :ingredients
    expect(recipe.ingredients).must_equal ["ingredients"]
    expect recipe.must_respond_to :uri
    expect(recipe.uri).must_equal ["uri"]
    expect recipe.must_respond_to :url
    expect(recipe.url).must_equal ["url"]
    expect recipe.must_respond_to :dietary_info
    expect(recipe.dietary_info).must_equal ["dietary_info"]
    expect recipe.must_respond_to :image_url
    expect(recipe.image_url).must_equal "image_url"
    expect recipe.must_respond_to :health_info
    expect(recipe.health_info).must_equal ["health_info"]
  end

end
