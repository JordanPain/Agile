class PageController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def home
  end

  def messages
    @contact_list = []
    Message.all do |message|
      if message.author_id == current_user.id
        if !@contact_list.include?(message.receiver_id)
          @contact_list << message.receiver_id
        end
      elsif message.receiver_id == current_user.id
        if !@contact_list.include?(message.author_id)
          @contact_list << message.author_id
        end
      end
    end

    @contacts = User.all.where( @contact_list )

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
