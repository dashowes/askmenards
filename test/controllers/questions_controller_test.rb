require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  def setup
    @question = questions(:oscar)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Question.count' do
      post :create, question: { content: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Question.count' do
      delete :destroy, id: @question
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy for wrong question" do
    log_in_as(users(:michael))
    question = questions(:ants)
    assert_no_difference 'Question.count' do
      delete :destroy, id: question
    end
    assert_redirected_to root_url
  end
end