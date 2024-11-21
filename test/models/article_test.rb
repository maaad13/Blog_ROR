require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  self.use_transactional_tests = false
  test "should not save article without title" do
    article = Article.new
    assert_not article.save, "Saved the article without a title"
  end
  test "should report error" do
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
  test "newly created users are active by default" do
    user = User.create!(email: "test@example.com", password: "password123")
    assert user.active?, "Newly created users should be active by default"
  end
  test "current_scope_of_user" do 
    assert User.current_scope.blank?
  end
    test "current_transaction" do
      assert_not User.current_transaction.blank?, "Expected a transaction to be present"
    end
    
end
