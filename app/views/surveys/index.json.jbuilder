json.array!(@surveys) do |survey|
  json.extract! survey, :id, :question_one, :question_two, :question_three, :question_four, :question_five, :question_six, :question_seven, :question_eight, :question_nine, :question_ten, :question_eleven, :question_twelve, :question_thirteen, :question_fourteen, :question_fifthteen, :question_sixteen, :question_seventeen, :question_eighteen, :question_nineteen, :question_twenty, :user_id
  json.url survey_url(survey, format: :json)
end
