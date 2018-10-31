require 'test_helper'

describe PagesController do
  it "should get home" do
    get root_path

    must_respond_with :success
  end
end
