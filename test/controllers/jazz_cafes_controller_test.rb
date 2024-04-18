require "test_helper"

class JazzCafesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jazz_cafe = jazz_cafes(:one)
  end

  test "should get index" do
    get jazz_cafes_url
    assert_response :success
  end

  test "should get new" do
    get new_jazz_cafe_url
    assert_response :success
  end

  test "should create jazz_cafe" do
    assert_difference("JazzCafe.count") do
      post jazz_cafes_url, params: { jazz_cafe: { name: @jazz_cafe.name } }
    end

    assert_redirected_to jazz_cafe_url(JazzCafe.last)
  end

  test "should show jazz_cafe" do
    get jazz_cafe_url(@jazz_cafe)
    assert_response :success
  end

  test "should get edit" do
    get edit_jazz_cafe_url(@jazz_cafe)
    assert_response :success
  end

  test "should update jazz_cafe" do
    patch jazz_cafe_url(@jazz_cafe), params: { jazz_cafe: { name: @jazz_cafe.name } }
    assert_redirected_to jazz_cafe_url(@jazz_cafe)
  end

  test "should destroy jazz_cafe" do
    assert_difference("JazzCafe.count", -1) do
      delete jazz_cafe_url(@jazz_cafe)
    end

    assert_redirected_to jazz_cafes_url
  end
end
