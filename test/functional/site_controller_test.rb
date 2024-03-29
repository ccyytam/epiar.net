require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get archive" do
    get :archive
    assert_response :success
  end

  test "should get download" do
    get :download
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
