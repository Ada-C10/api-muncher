require 'test_helper'

describe Recipe do

  # arguments: label, uri, url, image, ingredientLines, dietLabels


  it "raises an error if label or uri are empty strings" do

    empty_string = ''
    valid_input = 1

    expect {
      Recipe.new(empty_string, valid_input,'url', 'image', 'ingredientLines', 'dietLabels' )
    }.must_raise ArgumentError

    expect {
      Recipe.new(valid_input, empty_string, 'url', 'image', 'ingredientLines', 'dietLabels')
    }.must_raise ArgumentError

    expect {
      Recipe.new(empty_string, empty_string, 'url', 'image', 'ingredientLines', 'dietLabels')
    }.must_raise ArgumentError

  end

end
