require "application_system_test_case"

class ActividadTemasTest < ApplicationSystemTestCase
  setup do
    @actividad_tema = actividad_temas(:one)
  end

  test "visiting the index" do
    visit actividad_temas_url
    assert_selector "h1", text: "Actividad Temas"
  end

  test "creating a Actividad tema" do
    visit actividad_temas_url
    click_on "New Actividad Tema"

    fill_in "Descripcion", with: @actividad_tema.descripcion
    click_on "Create Actividad tema"

    assert_text "Actividad tema was successfully created"
    click_on "Back"
  end

  test "updating a Actividad tema" do
    visit actividad_temas_url
    click_on "Edit", match: :first

    fill_in "Descripcion", with: @actividad_tema.descripcion
    click_on "Update Actividad tema"

    assert_text "Actividad tema was successfully updated"
    click_on "Back"
  end

  test "destroying a Actividad tema" do
    visit actividad_temas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Actividad tema was successfully destroyed"
  end
end
