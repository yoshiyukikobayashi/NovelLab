require 'test_helper'

class ReadersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get readers_new_url
    assert_response :success
  end

end
