require "test_helper"

describe SessionsController do
  it "should get create" do
    # set up mock auth hash

    # get auth_callback_path
    # value(response).must_be :success?
  end

  it "should get destroy" do
    delete logout_path
    value(response).must_be :success?
  end

end
