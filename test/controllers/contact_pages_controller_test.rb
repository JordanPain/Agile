require 'test_helper'

class ContactPagesControllerTest < ActionController::TestCase
  setup do
    @contact_page = contact_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_page" do
    assert_difference('ContactPage.count') do
      post :create, contact_page: { contact_me: @contact_page.contact_me, email: @contact_page.email, first_name: @contact_page.first_name, last_name: @contact_page.last_name, phone: @contact_page.phone, question: @contact_page.question, reason_selected: @contact_page.reason_selected, subscribe_newsletter: @contact_page.subscribe_newsletter }
    end

    assert_redirected_to contact_page_path(assigns(:contact_page))
  end

  test "should show contact_page" do
    get :show, id: @contact_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact_page
    assert_response :success
  end

  test "should update contact_page" do
    patch :update, id: @contact_page, contact_page: { contact_me: @contact_page.contact_me, email: @contact_page.email, first_name: @contact_page.first_name, last_name: @contact_page.last_name, phone: @contact_page.phone, question: @contact_page.question, reason_selected: @contact_page.reason_selected, subscribe_newsletter: @contact_page.subscribe_newsletter }
    assert_redirected_to contact_page_path(assigns(:contact_page))
  end

  test "should destroy contact_page" do
    assert_difference('ContactPage.count', -1) do
      delete :destroy, id: @contact_page
    end

    assert_redirected_to contact_pages_path
  end
end
