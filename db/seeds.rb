# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include Faker

User.destroy_all
# just to clear the table Survey.destroy_all

# just to clear the table
Survey.destroy_all
jeff = User.create(
    email:"jlslickt78@yahoo.com",
    password:"slick1978",
    userName:"jlslickt78",
    firstName:"Jeff",
    lastName:"Tartt",
    birthdate:Date.new(1991,6,15),
    city:"Spokane",
    state:"WA",
    zip:99207,
    about:"I am a very cool.",
    gender:"male",
    admin:true
)
jeff.save!
puts jeff.inspect

dave = User.create(
    email:"dljones@gmail.com",
    password:"password",
    userName:"PirateSinker",
    firstName:"Dave",
    lastName:"Jones",
    birthdate:Date.new(1865,4,26),
    city:"Spokane",
    state:"WA",
    zip:99203,
    about:"I am the ancient master of all things Macintosh.",
    gender:"male",
    admin:true
)
dave.save!
puts dave.inspect

userNameNumber = 1
101.times do

  user = User.create(
      email:Internet.email,
      password:"password",
      userName:App.name + userNameNumber.to_s,
      firstName:Name.first_name,
      lastName:Name.last_name,
      birthdate:Time.at((rand * Time.now.to_i) - 18.years),
      city:Address.city,
      state:Address.state_abbr,
      zip:99203,
      about:Lorem.sentence(6, false, 12),
      gender:["male", "female"].sample(),
      admin:false,
      thumbnail: "https://placeimg.com/250/250/people#{rand(1..10000)}",
      avatar:Avatar.image
  )
  user.save!
  puts user.inspect
userNameNumber += 1
end




Message.destroy_all

20.times do
    User.all.each do |user|
        message = Message.create(
            author_id:user.id,
            receiver_id:User.order("RANDOM()").limit(1)[0].id,
            subject:Lorem.word,
            content:Lorem.sentences.sample()
        )
        message.save!
        puts message.inspect
    end
end

Survey.destroy_all

User.all.each do |user|
    sampleone = ["Yes", "No"]
    sampletwo = ["Yes", "No"]
    samplethree = ["Yes", "No"]
    samplefour = ["Dog", "Cat","Both","Other","None"]
    samplefive = ["Yes", "No"]
    samplesix = ["Read", "Movies", "Bar Hop", "Party", "Video Games"]
    sampleseven = ["Yes", "No"]
    sampleeight = ["Guys", "Girls", "Both"]
    samplenine = ["Short Term", "Long Term"]
    sampleten= ["Yes", "Doesn't matter"]
    sampleelven = ["Yes", "No"]
    sampletwelve = ["Yes", "No"]
    samplethirteen = ["Yes", "No", "Doesn't matter"]
    samplefourteen = ["1", "2", "3 or more", "No"]
    samplefifthteen = ["Yes", "No"]
    samplesixteen = ["Yes", "No"]
    sampleseventeen = ["Yes", "No"]
    sampleeightteen = ["Yes", "No", "Doesn't matter"]
    samplenineteen = ["18-25", "25-40", "40-60", "60+", "None"]
    sampletwenty = ["Yes", "No", "Doesn't matter"]

    newSurvey = Survey.create(
    question_one: sampleone.sample(),
    question_two: sampletwo.sample(),
    question_three: samplethree.sample(),
    question_four: samplefour.sample(),
    question_five: samplefive.sample(),
    question_six: samplesix.sample(),
    question_seven: sampleseven.sample(),
    question_eight: sampleeight.sample(),
    question_nine: samplenine.sample(),
    question_ten: sampleten.sample(),
    question_eleven: sampleelven.sample(),
    question_twelve: sampletwelve.sample(),
    question_thirteen: samplethirteen.sample(),
    question_fourteen: samplefourteen.sample(),
    question_fifthteen: samplefifthteen.sample(),
    question_sixteen: samplesixteen.sample(),
    question_seventeen: sampleseventeen.sample(),
    question_eighteen: sampleeightteen.sample(),
    question_nineteen: samplenineteen.sample(),
    question_twenty: sampletwenty.sample(),
    user_id: user.id

    )
    user.survey = newSurvey.id
    user.save!
    newSurvey.save!
    puts newSurvey.inspect
    puts user.inspect
end


