require 'test_helper'

class BelongingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get belongings_create_url
    assert_response :success
  end

end
