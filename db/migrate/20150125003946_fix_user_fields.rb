class FixUserFields < ActiveRecord::Migration
  def change
    remove_column :users, :age, :integer
    add_column :users, :birthdate, :date
    add_column :users, :userName, :string
  end
end
