class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  respond_to :html


  def index
    @contact = User.find(params[:contact_id])
    @messages = Message.all.where( "author_id = #{current_user.id} OR receiver_id = #{current_user.id}")
                    .where( "author_id = #{@contact.id} OR receiver_id = #{@contact.id}")
                    .order( "created_at" )
    respond_with(@messages)
  end

  def show
    @contact = User.find(params[:contact_id])
    redirect_to :action => :index, :contact_id => @contact.id
  end

  def new
    @message = Message.new
    @sender = current_user
    if params[:receiver_id]
      @receiver = User.find(params[:receiver_id])
    end
    respond_with(@message)
  end

  def edit
    @sender = User.find(@message.author_id)
    @receiver = User.find(@message.receiver_id)
  end

  def create
    @message = Message.new(message_params)
    @message.save
    #@contact = User.find(params[:receiver_id])
    redirect_to :action => :index, :contact_id => @message.receiver_id
        #respond_with(@message)
  end

  def update
    @message.update(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_path, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:author_id, :receiver_id, :subject, :content)
    end
end
