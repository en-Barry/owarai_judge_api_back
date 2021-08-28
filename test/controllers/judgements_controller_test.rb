require 'test_helper'

class JudgementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get judgements_index_url
    assert_response :success
  end

  test "should get create" do
    get judgements_create_url
    assert_response :success
  end

  test "should get update" do
    get judgements_update_url
    assert_response :success
  end

  test "should get destroy" do
    get judgements_destroy_url
    assert_response :success
  end

end
