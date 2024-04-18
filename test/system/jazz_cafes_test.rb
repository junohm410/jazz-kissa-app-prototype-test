require "application_system_test_case"

class JazzCafesTest < ApplicationSystemTestCase
  setup do
    @jazz_cafe = jazz_cafes(:one)
  end

  test "visiting the index" do
    visit jazz_cafes_url
    assert_selector "h1", text: "Jazz cafes"
  end

  test "should create jazz cafe" do
    visit jazz_cafes_url
    click_on "New jazz cafe"

    fill_in "Name", with: @jazz_cafe.name
    click_on "Create Jazz cafe"

    assert_text "Jazz cafe was successfully created"
    click_on "Back"
  end

  test "should update Jazz cafe" do
    visit jazz_cafe_url(@jazz_cafe)
    click_on "Edit this jazz cafe", match: :first

    fill_in "Name", with: @jazz_cafe.name
    click_on "Update Jazz cafe"

    assert_text "Jazz cafe was successfully updated"
    click_on "Back"
  end

  test "should destroy Jazz cafe" do
    visit jazz_cafe_url(@jazz_cafe)
    click_on "Destroy this jazz cafe", match: :first

    assert_text "Jazz cafe was successfully destroyed"
  end
end
