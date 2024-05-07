class UserJob
  include Sidekiq::Job
  sidekiq_options retry: 1

  def perform(id)
    UsersMailer.notification_email(id).deliver_later
  end
end
