
=begin
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @users = User.all
    respond_with(@users)
  end

  def show
    respond_with(@user)
  end

  def new
    @user = User.new
    respond_with(@user)
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.save
    respond_with(@user)
  end

  def update
    @user.update(user_params)
    respond_with(@user)
  end

  def destroy
    @user.destroy
    respond_with(@user)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :username, :firstName, :lastName, :birthdate, :city, :state, :zip, :about, :gender, :admin)

    end
end
=end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :redirect, only: [:index, :show]

  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def redirect
    #redirect_to home_path
  end

  # GET /users
  # GET /users.json
  def index
    users_scope = User.current_scope
    users_scope = users_scope.like(params[:filter]) if params[:filter]
    @users = smart_listing_create :users, users_scope, partial: "users/listing",
                                  default_sort: {firstName: "asc"}


  end

  # GET /users/1
  # GET /users/1.json
  def show
    @current_user = current_user

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        if params[:user][:cover].present?
          format.html { render :crop_cover }
        else if
        params[:user][:avatar].present?
               format.html { render :crop }
             end
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        end
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :username, :firstName, :lastName, :birthdate, :city, :state, :zip, :about, :gender, :avatar, :cover, :survey, :admin, :voted, :crop_x, :crop_y, :crop_w, :crop_h)

  end
end
