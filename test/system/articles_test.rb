require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "viewing the index" do
    user = users(:one) 
    sign_in user
    
    Article.create!(tittle: "First Article", body: "Content of the first article", status: "public")

    visit articles_path
    
    assert_selector "h1", text: "Articles"
  end
end
