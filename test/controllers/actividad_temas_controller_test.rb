require 'test_helper'

class ActividadTemasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actividad_tema = actividad_temas(:one)
  end

  test "should get index" do
    get actividad_temas_url
    assert_response :success
  end

  test "should get new" do
    get new_actividad_tema_url
    assert_response :success
  end

  test "should create actividad_tema" do
    assert_difference('ActividadTema.count') do
      post actividad_temas_url, params: { actividad_tema: { descripcion: @actividad_tema.descripcion } }
    end

    assert_redirected_to actividad_tema_url(ActividadTema.last)
  end

  test "should show actividad_tema" do
    get actividad_tema_url(@actividad_tema)
    assert_response :success
  end

  test "should get edit" do
    get edit_actividad_tema_url(@actividad_tema)
    assert_response :success
  end

  test "should update actividad_tema" do
    patch actividad_tema_url(@actividad_tema), params: { actividad_tema: { descripcion: @actividad_tema.descripcion } }
    assert_redirected_to actividad_tema_url(@actividad_tema)
  end

  test "should destroy actividad_tema" do
    assert_difference('ActividadTema.count', -1) do
      delete actividad_tema_url(@actividad_tema)
    end

    assert_redirected_to actividad_temas_url
  end
end
