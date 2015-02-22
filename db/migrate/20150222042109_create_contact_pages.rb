class CreateContactPages < ActiveRecord::Migration
  def change
    create_table :contact_pages do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :contact_me
      t.string :reason_selected
      t.text :question
      t.string :subscribe_newsletter

      t.timestamps
    end
  end
end
