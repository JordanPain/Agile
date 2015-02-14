class PageController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  helper_method :bool_compare, :score_surveys, :order_scores, :find_user
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def home
  end

  def browse
=begin
    page = params[:page]
    limit = 10

    whereString = ""
    whereArray = [whereString]

    if params[:byCity] == "yes"
      @byCity = true
      whereString << "city = ?"
      whereArray << ['Spokane']
      if params[:male] == "yes" or params[:female] == "yes"
        whereString << " AND ("
      end
    end
    if params[:male] == "yes"
      @male = true
      whereString << " gender = 'male'"
      if params[:female] == "yes"
        whereString << " OR"
      end
    end
    if params[:female] == "yes"
      @female = true
      whereString << " gender = 'female'"
    end
    if @byCity == true && (@male == true || @female == true)
      whereString << ")"
    end
=end


    @users = smart_listing_create(:users,
                                  User.all,#.where(whereArray),
                                  partial: "page/listing")
                                  #, default_sort: {firstName: "asc"}


    #@users = @users.page(page).per(limit)

  end

  def match
    @surveys = Survey.all
    @other_surveys = Survey.where("user_id != #{current_user.id}")

    @user = current_user.id
    #Current user is an User object. Also
    @current_survey = Survey.find( current_user.survey )
    @surveys = Survey.all
    @ordered_surveys = score_surveys(@current_survey, @other_surveys )
    @test = find_user( @ordered_surveys)
    @survey_score = []
  end

  def find_user ( list )
    users = []
    user_profile = []
    list.each do |item|
      users << item[0]
    end
    users.each do |profile|
     user_profile << Survey.where("user_id == #{profile}")
    end
    return user_profile
  end

  def bool_compare( current_survey, other_survey, survey_score , question,  point_value)
    if current_survey.send(question.to_sym) == other_survey.send(question.to_sym)
      survey_score += point_value
    else current_survey.send(question.to_sym) != other_survey.send(question.to_sym)
    survey_score += 0
    end
    return  survey_score
  end

  def score_surveys( current_survey, surveys )
    compared_surveys = []
    survey_score = 0
    surveys.each do |s|
      #starting score for each survey is 0
      #this keeps the survey object and it's score together
      survey_array = survey_score
      # array = User Survey Other Survey Scored Points Question # Point Value
      #returns User Suvery Survey Score survey_array =
      survey_array += bool_compare( current_survey, s, survey_score , "question_one", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_two", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_three", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_four", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_five", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_six", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_seven", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_eight", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_nine", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_ten", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_eleven", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_twelve", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_thirteen", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_fourteen", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_fifthteen", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_sixteen", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_seventeen", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_eighteen", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_nineteen", 1 )
      survey_array += bool_compare( current_survey, s, survey_score , "question_twenty", 1 )

      ##keep running the functions until you have compared all questions
      #for example
      #survey_array = multiple_choice_compare( survey_array, question2, 10 )
      ##then add the survey to the compared_surveys array
      compared_surveys << [s.user_id ,survey_array]
    end
    ##down here, we want to order the array by score

    ordered_surveys = order_scores (compared_surveys)

    # I just made up ^ ^this method^ ^ but we can find a way to do it
    ##then return the ordered array of surveys
    return ordered_surveys
  end

  def order_scores( scores )
    new = scores.sort_by { |score| [score[1], score[0]]}
    return new
  end

  def profile
  end

  def support
  end

  def contact_us
    flash[:notice] == nil
    @email = params[:email]
    if @email && @email.empty?
      flash[:notice] = "Please enter your email!"
    else
      flash[:notice] == nil
    end

    @last_name = params[:last_name]
    if @last_name && @last_name.empty?
      flash[:notice] = "Please enter your last name!"
    else
      flash[:notice] == nil
    end

    @first_name = params[:first_name]
    if @first_name && @first_name.empty?
      flash[:notice] = "Please enter your first name!"
    else
      flash[:notice] == nil
    end

    @phone = params[:phone]

    @contact_me = params[:contact_me]
    if @contact_me.nil?
      @contact_me = "email"
    end

    @reason_selected = params[:contact_reason]
    @contact_reason = ["Customer Support", "Technical Issue"]

    @question = params[:question]

    @subscribe_newsletter = params[:subscribe_newsletter]
    if @subscribe_newsletter == "1"
      @subscribe_newsletter = "yes"
    end

    @notify_products = params[:notify_products]
    if @notify_products == "1"
      @notify_products = "yes"
    end


    @commit = params[:commit].nil? ? false : true
  end

end
