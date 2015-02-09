require 'test_helper'

class SurveysControllerTest < ActionController::TestCase
  setup do
    @survey = surveys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:surveys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey" do
    assert_difference('Survey.count') do
      post :create, survey: { question_eight: @survey.question_eight, question_eighteen: @survey.question_eighteen, question_eleven: @survey.question_eleven, question_fifthteen: @survey.question_fifthteen, question_five: @survey.question_five, question_four: @survey.question_four, question_fourteen: @survey.question_fourteen, question_nine: @survey.question_nine, question_nineteen: @survey.question_nineteen, question_one: @survey.question_one, question_seven: @survey.question_seven, question_seventeen: @survey.question_seventeen, question_six: @survey.question_six, question_sixteen: @survey.question_sixteen, question_ten: @survey.question_ten, question_thirteen: @survey.question_thirteen, question_three: @survey.question_three, question_twelve: @survey.question_twelve, question_twenty: @survey.question_twenty, question_two: @survey.question_two, user_id: @survey.user_id }
    end

    assert_redirected_to survey_path(assigns(:survey))
  end

  test "should show survey" do
    get :show, id: @survey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @survey
    assert_response :success
  end

  test "should update survey" do
    patch :update, id: @survey, survey: { question_eight: @survey.question_eight, question_eighteen: @survey.question_eighteen, question_eleven: @survey.question_eleven, question_fifthteen: @survey.question_fifthteen, question_five: @survey.question_five, question_four: @survey.question_four, question_fourteen: @survey.question_fourteen, question_nine: @survey.question_nine, question_nineteen: @survey.question_nineteen, question_one: @survey.question_one, question_seven: @survey.question_seven, question_seventeen: @survey.question_seventeen, question_six: @survey.question_six, question_sixteen: @survey.question_sixteen, question_ten: @survey.question_ten, question_thirteen: @survey.question_thirteen, question_three: @survey.question_three, question_twelve: @survey.question_twelve, question_twenty: @survey.question_twenty, question_two: @survey.question_two, user_id: @survey.user_id }
    assert_redirected_to survey_path(assigns(:survey))
  end

  test "should destroy survey" do
    assert_difference('Survey.count', -1) do
      delete :destroy, id: @survey
    end

    assert_redirected_to surveys_path
  end
end
