class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :userName
    devise_parameter_sanitizer.for(:sign_up) << :gender
    devise_parameter_sanitizer.for(:sign_up) << :firstName
    devise_parameter_sanitizer.for(:sign_up) << :lastName
    devise_parameter_sanitizer.for(:sign_up) << :birthdate
    devise_parameter_sanitizer.for(:sign_up) << :city
    devise_parameter_sanitizer.for(:sign_up) << :state
    devise_parameter_sanitizer.for(:sign_up) << :zip
    devise_parameter_sanitizer.for(:sign_up) << :about
    devise_parameter_sanitizer.for(:sign_up) << :admin
    devise_parameter_sanitizer.for(:sign_up) << :avatar
    devise_parameter_sanitizer.for(:sign_up) << :avatar_cache
    devise_parameter_sanitizer.for(:sign_up) << :remove_avatar
  end

  def voting_setup
    if @featured_user
      @winner = Matchmaker.where( "votes" == Matchmaker.maximum("votes") )
    end
    if Matchmaker.all[0]
      @date = Matchmaker.all[0].created_at
      if @date != Date.today
        @featured_user = User.all.sample
        while @featured_user.id == Matchmaker.all[0].featured_user_id &&
            @featured_user.survey != null
          @featured_user = User.all.sample
        end

        Matchmaker.destroy_all

        @candidate_ids = []
        candidate_counter = 0
        5.times do
          @candidate_ids << match(@featured_user)[candidate_counter][0]
          candidate_counter += 1
        end

        @candidate_ids.each do |candidate|
          new_candidate = Matchmaker.create(
              featured_user_id: @featured_user.id,
              candidate_id: candidate
          )
          new_candidate.save!
        end

      end
    end



  end

end
