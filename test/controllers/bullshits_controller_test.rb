require "test_helper"

class BullshitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bullshit = bullshits(:one)
  end

  test "should get index" do
    get bullshits_url
    assert_response :success
  end

  test "should get new" do
    get new_bullshit_url
    assert_response :success
  end

  test "should create bullshit" do
    assert_difference("Bullshit.count") do
      post bullshits_url, params: { bullshit: { description: @bullshit.description, random_field: @bullshit.random_field, title: @bullshit.title } }
    end

    assert_redirected_to bullshit_url(Bullshit.last)
  end

  test "should show bullshit" do
    get bullshit_url(@bullshit)
    assert_response :success
  end

  test "should get edit" do
    get edit_bullshit_url(@bullshit)
    assert_response :success
  end

  test "should update bullshit" do
    patch bullshit_url(@bullshit), params: { bullshit: { description: @bullshit.description, random_field: @bullshit.random_field, title: @bullshit.title } }
    assert_redirected_to bullshit_url(@bullshit)
  end

  test "should destroy bullshit" do
    assert_difference("Bullshit.count", -1) do
      delete bullshit_url(@bullshit)
    end

    assert_redirected_to bullshits_url
  end
end
