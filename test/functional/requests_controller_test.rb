require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  setup do
    @request = requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request" do
    assert_difference('Request.count') do
      post :create, request: { author: @request.author, bclitem: @request.bclitem, customer_id: @request.customer_id, dateplaced: @request.dateplaced, duedate: @request.duedate, location_id: @request.location_id, locationplaced: @request.locationplaced, oclcnum: @request.oclcnum, pub: @request.pub, title: @request.title }
    end

    assert_redirected_to request_path(assigns(:request))
  end

  test "should show request" do
    get :show, id: @request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request
    assert_response :success
  end

  test "should update request" do
    put :update, id: @request, request: { author: @request.author, bclitem: @request.bclitem, customer_id: @request.customer_id, dateplaced: @request.dateplaced, duedate: @request.duedate, location_id: @request.location_id, locationplaced: @request.locationplaced, oclcnum: @request.oclcnum, pub: @request.pub, title: @request.title }
    assert_redirected_to request_path(assigns(:request))
  end

  test "should destroy request" do
    assert_difference('Request.count', -1) do
      delete :destroy, id: @request
    end

    assert_redirected_to requests_path
  end
end
