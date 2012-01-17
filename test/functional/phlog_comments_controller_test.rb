require 'test_helper'

class PhlogCommentsControllerTest < ActionController::TestCase
  setup do
    @phlog_comment = phlog_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phlog_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phlog_comment" do
    assert_difference('PhlogComment.count') do
      post :create, :phlog_comment => @phlog_comment.attributes
    end

    assert_redirected_to phlog_comment_path(assigns(:phlog_comment))
  end

  test "should show phlog_comment" do
    get :show, :id => @phlog_comment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @phlog_comment.to_param
    assert_response :success
  end

  test "should update phlog_comment" do
    put :update, :id => @phlog_comment.to_param, :phlog_comment => @phlog_comment.attributes
    assert_redirected_to phlog_comment_path(assigns(:phlog_comment))
  end

  test "should destroy phlog_comment" do
    assert_difference('PhlogComment.count', -1) do
      delete :destroy, :id => @phlog_comment.to_param
    end

    assert_redirected_to phlog_comments_path
  end
end
