require 'test_helper'

class AlumnosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alumno = alumnos(:one)
  end

  test "should get index" do
    get alumnos_url
    assert_response :success
  end

  test "should get new" do
    get new_alumno_url
    assert_response :success
  end

  test "should create alumno" do
    assert_difference('Alumno.count') do
      post alumnos_url, params: { alumno: { apellidos: @alumno.apellidos, cod_recovery: @alumno.cod_recovery, correo: @alumno.correo, documento: @alumno.documento, estado: @alumno.estado, nacimiento: @alumno.nacimiento, nombre: @alumno.nombre, psw: @alumno.psw, telefono: @alumno.telefono, tipo_documento: @alumno.tipo_documento } }
    end

    assert_redirected_to alumno_url(Alumno.last)
  end

  test "should show alumno" do
    get alumno_url(@alumno)
    assert_response :success
  end

  test "should get edit" do
    get edit_alumno_url(@alumno)
    assert_response :success
  end

  test "should update alumno" do
    patch alumno_url(@alumno), params: { alumno: { apellidos: @alumno.apellidos, cod_recovery: @alumno.cod_recovery, correo: @alumno.correo, documento: @alumno.documento, estado: @alumno.estado, nacimiento: @alumno.nacimiento, nombre: @alumno.nombre, psw: @alumno.psw, telefono: @alumno.telefono, tipo_documento: @alumno.tipo_documento } }
    assert_redirected_to alumno_url(@alumno)
  end

  test "should destroy alumno" do
    assert_difference('Alumno.count', -1) do
      delete alumno_url(@alumno)
    end

    assert_redirected_to alumnos_url
  end
end
