require "application_system_test_case"

class BullshitsTest < ApplicationSystemTestCase
  setup do
    @bullshit = bullshits(:one)
  end

  test "visiting the index" do
    visit bullshits_url
    assert_selector "h1", text: "Bullshits"
  end

  test "should create bullshit" do
    visit bullshits_url
    click_on "New bullshit"

    fill_in "Description", with: @bullshit.description
    fill_in "Random field", with: @bullshit.random_field
    fill_in "Title", with: @bullshit.title
    click_on "Create Bullshit"

    assert_text "Bullshit was successfully created"
    click_on "Back"
  end

  test "should update Bullshit" do
    visit bullshit_url(@bullshit)
    click_on "Edit this bullshit", match: :first

    fill_in "Description", with: @bullshit.description
    fill_in "Random field", with: @bullshit.random_field
    fill_in "Title", with: @bullshit.title
    click_on "Update Bullshit"

    assert_text "Bullshit was successfully updated"
    click_on "Back"
  end

  test "should destroy Bullshit" do
    visit bullshit_url(@bullshit)
    click_on "Destroy this bullshit", match: :first

    assert_text "Bullshit was successfully destroyed"
  end
end
