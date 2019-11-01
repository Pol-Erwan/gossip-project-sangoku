require 'test_helper'

class DynamicPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get dynamic_pages_name_url
    assert_response :success
  end

end
