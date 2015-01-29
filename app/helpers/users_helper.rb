module UsersHelper

  require 'Date'
  def userAge( year, month, day )
    #age = Date.today.year - dob.year
    #age -= 1 if Date.today < Date.new(dob.to_s) + age.years #for days before birthday
    #dob = dob.to_s.to_date.year
    #now = Date.today
    #now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)

    #return dob.instance_of? Date
    #parsed = dob.to_s

    return year + month + day
  end


  ##############
  #this code doesn't execute because some users in the db don't have birthdates
  #It should work if you clean it up, reseed and make birthdate field required!!!
  #YAYAYAYAYAYAYAYA BOOYAH (btw there are two ways up there. either one should work)
  ##################

end
