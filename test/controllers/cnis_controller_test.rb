require 'test_helper'

class CnisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cni = cnis(:one)
  end

  test "should get index" do
    get cnis_url
    assert_response :success
  end

  test "should get new" do
    get new_cni_url
    assert_response :success
  end

  test "should create cni" do
    assert_difference('Cni.count') do
      post cnis_url, params: { cni: { name: @cni.name, numeroRecepisse: @cni.numeroRecepisse, secondName: @cni.secondName } }
    end

    assert_redirected_to cni_url(Cni.last)
  end

  test "should show cni" do
    get cni_url(@cni)
    assert_response :success
  end

  test "should get edit" do
    get edit_cni_url(@cni)
    assert_response :success
  end

  test "should update cni" do
    patch cni_url(@cni), params: { cni: { name: @cni.name, numeroRecepisse: @cni.numeroRecepisse, secondName: @cni.secondName } }
    assert_redirected_to cni_url(@cni)
  end

  test "should destroy cni" do
    assert_difference('Cni.count', -1) do
      delete cni_url(@cni)
    end

    assert_redirected_to cnis_url
  end
end
