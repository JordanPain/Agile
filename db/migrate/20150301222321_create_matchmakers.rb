class CreateMatchmakers < ActiveRecord::Migration
  def change
    create_table :matchmakers do |t|
      t.integer :featured_user_id
      t.integer :candidate_id
      t.integer :votes, default: 0

      t.timestamps
    end

    add_column :users, :voted, :boolean, default: false

  end
end
