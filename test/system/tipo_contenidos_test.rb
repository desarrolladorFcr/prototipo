require "application_system_test_case"

class TipoContenidosTest < ApplicationSystemTestCase
  setup do
    @tipo_contenido = tipo_contenidos(:one)
  end

  test "visiting the index" do
    visit tipo_contenidos_url
    assert_selector "h1", text: "Tipo Contenidos"
  end

  test "creating a Tipo contenido" do
    visit tipo_contenidos_url
    click_on "New Tipo Contenido"

    fill_in "Nombre", with: @tipo_contenido.nombre
    click_on "Create Tipo contenido"

    assert_text "Tipo contenido was successfully created"
    click_on "Back"
  end

  test "updating a Tipo contenido" do
    visit tipo_contenidos_url
    click_on "Edit", match: :first

    fill_in "Nombre", with: @tipo_contenido.nombre
    click_on "Update Tipo contenido"

    assert_text "Tipo contenido was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo contenido" do
    visit tipo_contenidos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo contenido was successfully destroyed"
  end
end
