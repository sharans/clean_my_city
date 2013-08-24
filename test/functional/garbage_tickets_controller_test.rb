require 'test_helper'

class GarbageTicketsControllerTest < ActionController::TestCase
  setup do
    @garbage_ticket = garbage_tickets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:garbage_tickets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create garbage_ticket" do
    assert_difference('GarbageTicket.count') do
      post :create, garbage_ticket: { email: @garbage_ticket.email, is_open: @garbage_ticket.is_open, latitude: @garbage_ticket.latitude, level: @garbage_ticket.level, location: @garbage_ticket.location, longitude: @garbage_ticket.longitude, mobile: @garbage_ticket.mobile, remark: @garbage_ticket.remark }
    end

    assert_redirected_to garbage_ticket_path(assigns(:garbage_ticket))
  end

  test "should show garbage_ticket" do
    get :show, id: @garbage_ticket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @garbage_ticket
    assert_response :success
  end

  test "should update garbage_ticket" do
    put :update, id: @garbage_ticket, garbage_ticket: { email: @garbage_ticket.email, is_open: @garbage_ticket.is_open, latitude: @garbage_ticket.latitude, level: @garbage_ticket.level, location: @garbage_ticket.location, longitude: @garbage_ticket.longitude, mobile: @garbage_ticket.mobile, remark: @garbage_ticket.remark }
    assert_redirected_to garbage_ticket_path(assigns(:garbage_ticket))
  end

  test "should destroy garbage_ticket" do
    assert_difference('GarbageTicket.count', -1) do
      delete :destroy, id: @garbage_ticket
    end

    assert_redirected_to garbage_tickets_path
  end
end
