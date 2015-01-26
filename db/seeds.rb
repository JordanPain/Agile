# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include Faker

User.destroy_all


taylor = User.create(
    email:"righteousquesty@gmail.com",
    password:"password",
    userName:"Sir_Fricksalot",
    firstName:"Taylor",
    lastName:"Smith",
    birthdate:Date.new(1991,6,15),
    city:"Spokane",
    state:"WA",
    zip:99224,
    about:"I am a very cool and sexy guy. You probably want to melt all over me.",
    gender:"male",
    admin:true
)
taylor.save!
puts taylor.inspect


101.times do

  user = User.create(
      email:Internet.email,
      password:"password",
      userName:App.name,
      firstName:Name.first_name,
      lastName:Name.last_name,
      birthdate:Time.at((rand * Time.now.to_i) - 18.years),
      city:Address.city,
      state:Address.state_abbr,
      zip:Address.zip_code,
      about:Lorem.sentence(6, false, 12),
      gender:["male", "female"].sample(),
      admin:false
  )
  user.save!
  puts user.inspect

end
