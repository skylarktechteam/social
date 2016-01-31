require 'test_helper'

class ImagePostsControllerTest < ActionController::TestCase
 
 test "get new with new post" do
    user1 = users(:user1)
    get :new, {}, { user_id: user1.id }
    image_post = assigns(:image_post)
    assert image_post.new_record?
    assert_response :success
  end
  test "should create post" do
    user = users(:user1)
    params = {
      image_post: {
        title: "Test Title",
        url: "http://i.imgur.com/Y7syDEa.jpg"
} }
    post :create, params, { user_id: user.id }
    image_post = assigns(:image_post)
    assert image_post.persisted?
    assert_redirected_to post_url(image_post)
  end

end

