class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :surveys

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :userName, :firstName, :lastName, :birthdate, :city, :state, :zip
  validates_presence_of :gender, message: "must be selected."
  validates_uniqueness_of :userName
  validates_numericality_of :zip
  validates_length_of :zip, is: 5, message: "must be 5 digits."

  # mount_uploader :avatar, AvatarUploader
end

