require "application_system_test_case"

class RecursoAdicionalsTest < ApplicationSystemTestCase
  setup do
    @recurso_adicional = recurso_adicionals(:one)
  end

  test "visiting the index" do
    visit recurso_adicionals_url
    assert_selector "h1", text: "Recurso Adicionals"
  end

  test "creating a Recurso adicional" do
    visit recurso_adicionals_url
    click_on "New Recurso Adicional"

    fill_in "Titulo", with: @recurso_adicional.titulo
    click_on "Create Recurso adicional"

    assert_text "Recurso adicional was successfully created"
    click_on "Back"
  end

  test "updating a Recurso adicional" do
    visit recurso_adicionals_url
    click_on "Edit", match: :first

    fill_in "Titulo", with: @recurso_adicional.titulo
    click_on "Update Recurso adicional"

    assert_text "Recurso adicional was successfully updated"
    click_on "Back"
  end

  test "destroying a Recurso adicional" do
    visit recurso_adicionals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recurso adicional was successfully destroyed"
  end
end
