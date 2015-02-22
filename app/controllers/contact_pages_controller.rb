class ContactPagesController < ApplicationController
	before_action :set_contact_page, only: [:show, :edit, :update, :destroy]
	#before_action :redirect, only: [:index, :show]
	respond_to :html

	def index
		@contact_pages = ContactPage.all
		respond_with(@contact_pages)
	end

	def show
		@contact_page = ContactPage.find(params[:id])
		respond_with(@contact_page)
		flash[:success] = "Message created! You will be redirected in a moment..."
	end

	def new
		@contact_page = ContactPage.new
		respond_with(@contact_page)

	end

	def edit
	end

	def create
		@contact_page = ContactPage.new(contact_page_params)
		# if @contact_page.save

		if @contact_page.save
			flash[:success] = "Message created!"

			respond_with(@contact_page)
			#redirect_to home_path
		else
			render :action => 'new'
		end


	end

	def update
		@contact_page.update(contact_page_params)
		respond_with(@contact_page)
	end

	def destroy
		@contact_page.destroy
		respond_with(@contact_page)
	end

	private
	def set_contact_page
		@contact_page = ContactPage.find(params[:id])
	end

	def contact_page_params
		params.require(:contact_page).permit(:first_name, :last_name, :email, :phone, :contact_me, :reason_selected, :question, :subscribe_newsletter)
	end
end
