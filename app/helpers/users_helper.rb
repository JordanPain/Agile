module UsersHelper

  def userAge( dob )
    age = Date.today.year - dob.year
    age -= 1 if Date.today < dob + age.years #for days before birthday

    return age
  end


end
