require 'test_helper'

class S3imagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @s3image = s3images(:one)
  end

  test "should get index" do
    get s3images_url
    assert_response :success
  end

  test "should get new" do
    get new_s3image_url
    assert_response :success
  end

  test "should create s3image" do
    assert_difference('S3image.count') do
      post s3images_url, params: { s3image: { comment: @s3image.comment, file_name: @s3image.file_name, title: @s3image.title } }
    end

    assert_redirected_to s3image_url(S3image.last)
  end

  test "should show s3image" do
    get s3image_url(@s3image)
    assert_response :success
  end

  test "should get edit" do
    get edit_s3image_url(@s3image)
    assert_response :success
  end

  test "should update s3image" do
    patch s3image_url(@s3image), params: { s3image: { comment: @s3image.comment, file_name: @s3image.file_name, title: @s3image.title } }
    assert_redirected_to s3image_url(@s3image)
  end

  test "should destroy s3image" do
    assert_difference('S3image.count', -1) do
      delete s3image_url(@s3image)
    end

    assert_redirected_to s3images_url
  end
end
