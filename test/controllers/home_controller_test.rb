require "test_helper"

describe HomeController do
  it "index should pull up the homepage" do
    get root_path
    must_respond_with :success
  end
end
