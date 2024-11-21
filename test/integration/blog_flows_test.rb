require "test_helper"

class BlogFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "can see the welcome page" do
    user = users(:one)  
    sign_in user 
    get "/articles"
    assert_response :success
  end
end
