class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :question_one
      t.string :question_two
      t.string :question_three
      t.string :question_four
      t.string :question_five
      t.string :question_six
      t.string :question_seven
      t.string :question_eight
      t.string :question_nine
      t.string :question_ten
      t.string :question_eleven
      t.string :question_twelve
      t.string :question_thirteen
      t.string :question_fourteen
      t.string :question_fifthteen
      t.string :question_sixteen
      t.string :question_seventeen
      t.string :question_eighteen
      t.string :question_nineteen
      t.string :question_twenty
      t.integer :user_id


      t.timestamps
    end
    def change

    end
  end
end
