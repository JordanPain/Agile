class Survey < ActiveRecord::Base
  belongs_to :users
  validates_uniqueness_of :user_id
end
