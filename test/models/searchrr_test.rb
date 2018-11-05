require "test_helper"

describe Searchrr do
  let(:searchrr) { Searchrr.new }

  it "must be valid" do
    value(searchrr).must_be :valid?
  end
end
