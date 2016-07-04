require 'test_helper'

class WaitlistRequestsControllerTest < ActionController::TestCase
  setup do
    @waitlist_request = waitlist_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:waitlist_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create waitlist_request" do
    assert_difference('WaitlistRequest.count') do
      post :create, waitlist_request: { city: @waitlist_request.city, country: @waitlist_request.country, email: @waitlist_request.email, first_name: @waitlist_request.first_name, last_name: @waitlist_request.last_name, learning_language: @waitlist_request.learning_language, native_language: @waitlist_request.native_language }
    end

    assert_redirected_to waitlist_request_path(assigns(:waitlist_request))
  end

  test "should show waitlist_request" do
    get :show, id: @waitlist_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @waitlist_request
    assert_response :success
  end

  test "should update waitlist_request" do
    patch :update, id: @waitlist_request, waitlist_request: { city: @waitlist_request.city, country: @waitlist_request.country, email: @waitlist_request.email, first_name: @waitlist_request.first_name, last_name: @waitlist_request.last_name, learning_language: @waitlist_request.learning_language, native_language: @waitlist_request.native_language }
    assert_redirected_to waitlist_request_path(assigns(:waitlist_request))
  end

  test "should destroy waitlist_request" do
    assert_difference('WaitlistRequest.count', -1) do
      delete :destroy, id: @waitlist_request
    end

    assert_redirected_to waitlist_requests_path
  end
end
