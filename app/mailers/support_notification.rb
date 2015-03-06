class SupportNotification < ActionMailer::Base
  default from: "from@example.com"

  def support_notifier(email_params)
    @admin = "agile.soulmate@gmail.com"
    @subject = email_params[:reason_selected]

    @first_name = email_params[:first_name]
    @last_name = email_params[:last_name]
    @email = email_params[:email]
    @phone = email_params[:phone]
    @body = email_params[:question]

    @name = "#{@first_name}  #{@last_name}"
    @sent_on = Time.now

    mail to: @admin, subject: @subject
  end
end
