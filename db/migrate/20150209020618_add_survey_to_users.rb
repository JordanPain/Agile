class AddSurveyToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.integer :survey, null: true
    end
  end
end
