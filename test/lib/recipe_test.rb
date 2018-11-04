require 'test_helper'

describe Recipe do

    it "cannot be initialized with less than 2 parameters" do
      expect {
        Recipe.new
      }.must_raise ArgumentError

      expect {
        Recipe.new "Name"
      }.must_raise ArgumentError
    end
end
