class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :author_id
      t.integer :receiver_id
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
