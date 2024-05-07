class UsersMailer < ActionMailer::Base
  default from: 'no-reply@livedevs.com'
  def notification_email(id)
    @user = User.find(id)
    mail(to: @user.email, subject: 'notification email')
  end
  def notification_admin_email()
    admins = User.where(role: 'Admin')
    admins.each do |admin|
      mail(to: admin.email, subject: 'Notification failed background jobs')
    end
  end
end