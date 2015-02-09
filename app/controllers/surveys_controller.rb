class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @surveys = Survey.all
    respond_with(@surveys)
  end

  def show
    respond_with(@survey)
  end

  def new
    @survey = Survey.new
    respond_with(@survey)
  end

  def edit
  end

  def create
    @survey = Survey.new(survey_params)
    # Surveys Get current user for survey
    @survey.user_id = current_user.id
    #------
    @survey.save

    @user = current_user
    @user.survey = @survey.id
    @user.save

    respond_with(@survey)
  end

  def update
    @survey.update(survey_params)
    respond_with(@survey)
  end

  def destroy
    @survey.destroy
    respond_with(@survey)
  end

  private
    def set_survey
      @survey = Survey.find(params[:id])
    end

    def survey_params
    @quest1 = "True";
    if :question_one == ""
      :question_one == "Yes im null";
    end
      params.require(:survey).permit(:question_one, :question_two, :question_three, :question_four, :question_five, :question_six, :question_seven, :question_eight, :question_nine, :question_ten, :question_eleven, :question_twelve, :question_thirteen, :question_fourteen, :question_fifthteen, :question_sixteen, :question_seventeen, :question_eighteen, :question_nineteen, :question_twenty, :user_id)
    end
end
