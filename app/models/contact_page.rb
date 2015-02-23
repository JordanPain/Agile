class ContactPage < ActiveRecord::Base
	validates_presence_of :first_name, :last_name, :email

	# belongs_to :users
	# validates_uniqueness_of :user_id
end
