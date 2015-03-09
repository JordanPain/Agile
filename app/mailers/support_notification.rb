class SupportNotification < ActionMailer::Base
  default from: "from@example.com"

  def support_notifier(email_params)
    @admin = "agile.soulmate@gmail.com"
    @subject = email_params[:reason_selected]

    @user = User.find(email_params[:user_id])

    @first_name = @user.firstName
    @last_name = @user.lastName
    @email = @user.email
    @phone = email_params[:phone]
    @body = email_params[:question]

    @name = "#{@first_name}  #{@last_name}"
    @sent_on = Time.now

    mail to: @admin, subject: @subject
  end
end
