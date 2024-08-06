require "test_helper"

class ChaptersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @chapter = chapters(:one)
  end

  test "should get index" do
    get chapters_url
    assert_response :success
  end

  test "should get new when signed in" do
    # Mimic the router behavior of setting the Devise scope through the env.
    # (unnecessary as this does not inherit from Devise controller)
    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in admins(:test_admin)
    # assert something
    get new_chapter_url
    assert_response :success
  end

  test "should create chapter when signed in" do
    sign_in admins(:test_admin)

    assert_difference("Chapter.count") do
      post chapters_url, params: { chapter: { name: @chapter.name } }
    end

    assert_redirected_to pages_path
  end

  test "should show chapter" do
    get chapter_url(@chapter)
    assert_response :success
  end

  test "should get edit when signed in" do
    sign_in admins(:test_admin)
    get edit_chapter_url(@chapter)
    assert_response :success
  end

  test "should update chapter when signed in" do
    sign_in admins(:test_admin)
    patch chapter_url(@chapter), params: { chapter: { name: @chapter.name } }
    assert_redirected_to pages_path
  end

  test "should destroy chapter when signed in" do
    sign_in admins(:test_admin)
    assert_difference("Chapter.count", -1) do
      delete chapter_url(@chapter)
    end

    assert_redirected_to pages_url
  end

  test "should not get new when not signed in" do
    # assert something
    get new_chapter_url

    assert_response :redirect
  end

  test "should not create chapter when not signed in" do
    
    assert_no_difference("Chapter.count") do
      post chapters_url, params: { chapter: { name: @chapter.name } }
    end

    assert_response :redirect
  end

  test "should not get edit when not signed in" do
    
    get edit_chapter_url(@chapter)
    assert_response :redirect
  end

  test "should not update chapter when not signed in" do
    
    patch chapter_url(@chapter), params: { chapter: { name: @chapter.name } }
    assert_response :redirect
  end

  test "should not destroy chapter when not signed in" do
    
    assert_no_difference "Chapter.count" do
      delete chapter_url(@chapter)
    end

    assert_response :redirect
  end
end
