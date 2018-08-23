require 'test_helper'

class RecursoAdicionalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recurso_adicional = recurso_adicionals(:one)
  end

  test "should get index" do
    get recurso_adicionals_url
    assert_response :success
  end

  test "should get new" do
    get new_recurso_adicional_url
    assert_response :success
  end

  test "should create recurso_adicional" do
    assert_difference('RecursoAdicional.count') do
      post recurso_adicionals_url, params: { recurso_adicional: { titulo: @recurso_adicional.titulo } }
    end

    assert_redirected_to recurso_adicional_url(RecursoAdicional.last)
  end

  test "should show recurso_adicional" do
    get recurso_adicional_url(@recurso_adicional)
    assert_response :success
  end

  test "should get edit" do
    get edit_recurso_adicional_url(@recurso_adicional)
    assert_response :success
  end

  test "should update recurso_adicional" do
    patch recurso_adicional_url(@recurso_adicional), params: { recurso_adicional: { titulo: @recurso_adicional.titulo } }
    assert_redirected_to recurso_adicional_url(@recurso_adicional)
  end

  test "should destroy recurso_adicional" do
    assert_difference('RecursoAdicional.count', -1) do
      delete recurso_adicional_url(@recurso_adicional)
    end

    assert_redirected_to recurso_adicionals_url
  end
end
