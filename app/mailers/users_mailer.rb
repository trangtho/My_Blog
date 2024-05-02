class UsersMailer < ActionMailer::Base
  def notification_email(subcriber_id)
    @user = User.find(subcriber_id)

    mail(to: @user.email,
         subject: 'notification emails') do |format|
      format.text
      format.html
    end
  end
end