require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one) 
  end

  test "should get index" do
    sign_in @user
    get articles_url
    assert_response :success
  end

  test "should create article" do
    sign_in @user
    assert_difference('Article.count') do
      post articles_url, params: { article: { title: 'New Article', body: 'Article body', user_id: @user.id } }
    end
    assert_redirected_to article_url(Article.last)
  end
  
end
