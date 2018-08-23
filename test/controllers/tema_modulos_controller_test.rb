require 'test_helper'

class TemaModulosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tema_modulo = tema_modulos(:one)
  end

  test "should get index" do
    get tema_modulos_url
    assert_response :success
  end

  test "should get new" do
    get new_tema_modulo_url
    assert_response :success
  end

  test "should create tema_modulo" do
    assert_difference('TemaModulo.count') do
      post tema_modulos_url, params: { tema_modulo: { tema: @tema_modulo.tema } }
    end

    assert_redirected_to tema_modulo_url(TemaModulo.last)
  end

  test "should show tema_modulo" do
    get tema_modulo_url(@tema_modulo)
    assert_response :success
  end

  test "should get edit" do
    get edit_tema_modulo_url(@tema_modulo)
    assert_response :success
  end

  test "should update tema_modulo" do
    patch tema_modulo_url(@tema_modulo), params: { tema_modulo: { tema: @tema_modulo.tema } }
    assert_redirected_to tema_modulo_url(@tema_modulo)
  end

  test "should destroy tema_modulo" do
    assert_difference('TemaModulo.count', -1) do
      delete tema_modulo_url(@tema_modulo)
    end

    assert_redirected_to tema_modulos_url
  end
end
