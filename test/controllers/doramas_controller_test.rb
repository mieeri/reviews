require 'test_helper'

class DoramasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dorama = doramas(:one)
  end

  test "should get index" do
    get doramas_url
    assert_response :success
  end

  test "should get new" do
    get new_dorama_url
    assert_response :success
  end

  test "should create dorama" do
    assert_difference('Dorama.count') do
      post doramas_url, params: { dorama: {  } }
    end

    assert_redirected_to dorama_url(Dorama.last)
  end

  test "should show dorama" do
    get dorama_url(@dorama)
    assert_response :success
  end

  test "should get edit" do
    get edit_dorama_url(@dorama)
    assert_response :success
  end

  test "should update dorama" do
    patch dorama_url(@dorama), params: { dorama: {  } }
    assert_redirected_to dorama_url(@dorama)
  end

  test "should destroy dorama" do
    assert_difference('Dorama.count', -1) do
      delete dorama_url(@dorama)
    end

    assert_redirected_to doramas_url
  end
end
