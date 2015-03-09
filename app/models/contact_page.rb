class ContactPage < ActiveRecord::Base
	validates_presence_of :question

	validates_format_of :phone,
											:message => "must be a valid telephone number.",
											:with => /\A[\(\)0-9\- \+\.]{10,20} *[extension\.]{0,9} *[0-9]{0,5}\z/

	# belongs_to :users
	# validates_uniqueness_of :user_id
end
