require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest 
  include Devise::Test::IntegrationHelpers

  setup do
    @page = pages(:published)
  end

  # test "should get index" do
  #   get pages_url
  #   assert_response :success
  # end

  # test "should get new when signed in" do
  #   sign_in admins(:test_admin)
  #   get new_page_url
  #   assert_response :success
  # end

  # test "should create page when signed in" do
  #   sign_in admins(:test_admin)

  #   assert_difference 'Page.count' do
  #     post pages_path, params: { page: { 
  #       page_image: file_fixture_upload("dog.png", 'image/png'),
  #       chapter_id: @page.chapter_id,
  #       page_number: @page.page_number,
  #       published_at: @page.published_at,
  #       } }
  #   end
  # end

  #   assert_redirected_to pages_path
  # end

  # test "should show page" do
  #   get page_url(@page)
  #   assert_response :success
  # end

  # test "should get edit when signed in" do
  #   sign_in admins(:test_admin)
  #   get edit_page_url(@page)
  #   assert_response :success
  # end

  # test "should update page when signed in" do
  #   sign_in admins(:test_admin)
  #   patch page_url(@page), params: { page: { name: @page.name } }
  #   assert_redirected_to pages_path
  # end

  # test "should destroy page when signed in" do
  #   sign_in admins(:test_admin)
  #   assert_difference("page.count", -1) do
  #     delete page_url(@page)
  #   end

  #   assert_redirected_to pages_url
  # end

  # test "should not get new when not signed in" do
  #   # assert something
  #   get new_page_url

  #   assert_response :redirect
  # end

  # test "should not create page when not signed in" do
    
  #   assert_no_difference("page.count") do
  #     post pages_url, params: { page: { name: @page.name } }
  #   end

  #   assert_response :redirect
  # end

  # test "should not get edit when not signed in" do
    
  #   get edit_page_url(@page)
  #   assert_response :redirect
  # end

  # test "should not update page when not signed in" do
    
  #   patch page_url(@page), params: { page: { name: @page.name } }
  #   assert_response :redirect
  # end

  # test "should not destroy page when not signed in" do
    
  #   assert_no_difference "page.count" do
  #     delete page_url(@page)
  #   end

  #   assert_response :redirect
  # end
  # some_undefined_variable is not defined elsewhere in the test case
  # assert_raises(NameError) do
  #   some_undefined_variable
  # end

  # test "creating page with no image fails validation" do
  # # validate image, page, number
  # end

  # test "creating page with no page fails validation" do
  # # validate image, page, number
  # end

  # test "creating page with no page number fails validation" do
  # # validate image, page, number
  # end

  # test "edit page image works" do
  # end

  # test "edit page page works" do
  # end

  # test "edit page number works" do
  # end

  # # set up
  # # page 1 -- 1, 2, 3 -- page 2 -- 4, 5, 6 -- page 3 -- 7, 8, 9

  # test "if a new page is created at the start, bumps all other pages' page numbers up by 1" do
  #   # create new page with 1 as its page number
  #   # assert that the page it replaces and every page after increases number by 1
  #   assert true
  # end

  # test "if a new page is created at the middle, bumps all other pages after it up by 1" do
  #   # create new page with 3 as its page number
  #   # assert that the page it replaces and every page after increases number by 1
  #   # assert that the pages before it remain the same
  #   assert true
  # end

  # test "if a new page is created at the end, no pages are bumped" do
  #   # create new page with last number + 1 as its page number
  #   # assert that the pages before it remain the same
  #   assert true
  # end
end
