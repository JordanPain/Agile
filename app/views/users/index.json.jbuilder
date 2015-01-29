json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :firstName, :lastName, :age, :city, :state, :zip, :about, :gender, :admin
  json.url user_url(user, format: :json)
end
