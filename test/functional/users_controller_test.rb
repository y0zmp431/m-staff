require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	setup :activate_authlogic
  setup do
		UserSession.create(users :admin )
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { active: @user.active, email: "testmail@mail.com", login: "test_login", name: "test_name", password: "testpasswd", password_confirmation: "testpasswd"}
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { active: @user.active, email: @user.email, login: @user.login, name: @user.name, password: "password", password_confirmation: "password" }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
