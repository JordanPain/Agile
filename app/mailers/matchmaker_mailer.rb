class MatchmakerMailer < ActionMailer::Base
  default from: "from@example.com"

  def featured_notification( featured_user )
    @featured_user = featured_user
    mail to: @featured_user.email, subject: "You've been chosen as today's featured single!"
  end

  def featured_match( featured_user, matched_user )
    @featured_user = featured_user
    @matched_user = matched_user
    mail to: @featured_user.email, subject: "You've been matched!"
  end

  def winner_notification( matched_user, featured_user )
    @matched_user = matched_user
    @featured_user = featured_user
    mail to: @matched_user.email, subject: "You've been matched!"
  end

end
