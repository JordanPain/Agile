class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :surveys

  has_many :messages
  #has_many :contact_pages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :userName, :firstName, :lastName, :birthdate, :city, :state, :zip
  validates_presence_of :gender, message: "must be selected."
  validates_uniqueness_of :userName
  validates_numericality_of :zip
  validates_length_of :zip, is: 5, message: "must be 5 digits."

  mount_uploader :avatar, AvatarUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h


  after_update :crop_avatar
  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end

  mount_uploader :cover, CoverUploader
  attr_accessor :cropbackground_x, :cropbackground_y, :cropbackground_w, :cropbackground_h
  after_update :crop_background
  def crop_background
    cover.recreate_versions! if cropbackground_x.present?
  end


end

