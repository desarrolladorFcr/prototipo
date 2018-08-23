require "application_system_test_case"

class AlumnosTest < ApplicationSystemTestCase
  setup do
    @alumno = alumnos(:one)
  end

  test "visiting the index" do
    visit alumnos_url
    assert_selector "h1", text: "Alumnos"
  end

  test "creating a Alumno" do
    visit alumnos_url
    click_on "New Alumno"

    fill_in "Apellidos", with: @alumno.apellidos
    fill_in "Cod Recovery", with: @alumno.cod_recovery
    fill_in "Correo", with: @alumno.correo
    fill_in "Documento", with: @alumno.documento
    fill_in "Estado", with: @alumno.estado
    fill_in "Nacimiento", with: @alumno.nacimiento
    fill_in "Nombre", with: @alumno.nombre
    fill_in "Psw", with: @alumno.psw
    fill_in "Telefono", with: @alumno.telefono
    fill_in "Tipo Documento", with: @alumno.tipo_documento
    click_on "Create Alumno"

    assert_text "Alumno was successfully created"
    click_on "Back"
  end

  test "updating a Alumno" do
    visit alumnos_url
    click_on "Edit", match: :first

    fill_in "Apellidos", with: @alumno.apellidos
    fill_in "Cod Recovery", with: @alumno.cod_recovery
    fill_in "Correo", with: @alumno.correo
    fill_in "Documento", with: @alumno.documento
    fill_in "Estado", with: @alumno.estado
    fill_in "Nacimiento", with: @alumno.nacimiento
    fill_in "Nombre", with: @alumno.nombre
    fill_in "Psw", with: @alumno.psw
    fill_in "Telefono", with: @alumno.telefono
    fill_in "Tipo Documento", with: @alumno.tipo_documento
    click_on "Update Alumno"

    assert_text "Alumno was successfully updated"
    click_on "Back"
  end

  test "destroying a Alumno" do
    visit alumnos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Alumno was successfully destroyed"
  end
end
