require 'test_helper'

class TipoContenidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_contenido = tipo_contenidos(:one)
  end

  test "should get index" do
    get tipo_contenidos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_contenido_url
    assert_response :success
  end

  test "should create tipo_contenido" do
    assert_difference('TipoContenido.count') do
      post tipo_contenidos_url, params: { tipo_contenido: { nombre: @tipo_contenido.nombre } }
    end

    assert_redirected_to tipo_contenido_url(TipoContenido.last)
  end

  test "should show tipo_contenido" do
    get tipo_contenido_url(@tipo_contenido)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_contenido_url(@tipo_contenido)
    assert_response :success
  end

  test "should update tipo_contenido" do
    patch tipo_contenido_url(@tipo_contenido), params: { tipo_contenido: { nombre: @tipo_contenido.nombre } }
    assert_redirected_to tipo_contenido_url(@tipo_contenido)
  end

  test "should destroy tipo_contenido" do
    assert_difference('TipoContenido.count', -1) do
      delete tipo_contenido_url(@tipo_contenido)
    end

    assert_redirected_to tipo_contenidos_url
  end
end
