require 'test_helper'

describe Recipe do
  it "cannot be initialized without a name or id" do
    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new("Chicken Pot Pie", url: "www.test.com", image: "www.blahimageurl.com", :heatlh_labels = ["vegan", "veggie"])
    }.must_raise ArgumentError
    # 
    # expect {
    #   Recipe.new(id: "208509835091095815")
    # }.must_raise ArgumentError
    #
    # expect {
    #   Recipe.new(url: "www.test.com")
    # }.must_raise ArgumentError

    # :name, :id, :url, :image, :ingredients, :calories, :health_labels
  end

  it "can be created with needed paramsters" do

  end

end
