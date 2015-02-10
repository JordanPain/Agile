class AddUserIndexToSurveys < ActiveRecord::Migration
  def change
    add_index :surveys, :user_id,                unique: true

  end
end
