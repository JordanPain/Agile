class UpdateContactPages < ActiveRecord::Migration
  def change
    remove_columns :contact_pages, :first_name, :last_name, :email
    #add_column :contact_pages, :user_id, :integer
  end
end
