require 'test_helper'

class RecepiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recepies_index_url
    assert_response :success
  end

end
