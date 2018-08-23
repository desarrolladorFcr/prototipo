require "application_system_test_case"

class TemaModulosTest < ApplicationSystemTestCase
  setup do
    @tema_modulo = tema_modulos(:one)
  end

  test "visiting the index" do
    visit tema_modulos_url
    assert_selector "h1", text: "Tema Modulos"
  end

  test "creating a Tema modulo" do
    visit tema_modulos_url
    click_on "New Tema Modulo"

    fill_in "Tema", with: @tema_modulo.tema
    click_on "Create Tema modulo"

    assert_text "Tema modulo was successfully created"
    click_on "Back"
  end

  test "updating a Tema modulo" do
    visit tema_modulos_url
    click_on "Edit", match: :first

    fill_in "Tema", with: @tema_modulo.tema
    click_on "Update Tema modulo"

    assert_text "Tema modulo was successfully updated"
    click_on "Back"
  end

  test "destroying a Tema modulo" do
    visit tema_modulos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tema modulo was successfully destroyed"
  end
end
