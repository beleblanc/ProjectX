require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { city: @person.city, dob: @person.dob, email: @person.email, employer: @person.employer, first_name: @person.first_name, home_address: @person.home_address, nationality: @person.nationality, occupation: @person.occupation, other_name: @person.other_name, pin: @person.pin, post_address: @person.post_address, post_code: @person.post_code, province: @person.province, sex: @person.sex, surname: @person.surname, tel_home: @person.tel_home, tel_mobile: @person.tel_mobile, tel_office: @person.tel_office, title: @person.title, township: @person.township, user: @person.user }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    put :update, id: @person, person: { city: @person.city, dob: @person.dob, email: @person.email, employer: @person.employer, first_name: @person.first_name, home_address: @person.home_address, nationality: @person.nationality, occupation: @person.occupation, other_name: @person.other_name, pin: @person.pin, post_address: @person.post_address, post_code: @person.post_code, province: @person.province, sex: @person.sex, surname: @person.surname, tel_home: @person.tel_home, tel_mobile: @person.tel_mobile, tel_office: @person.tel_office, title: @person.title, township: @person.township, user: @person.user }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end
