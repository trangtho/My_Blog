Sidekiq.configure_server do |config|
    config.redis = {url: "redis://localhost:6379/0"}
    config.death_handlers << ->(job, ex) do
      puts "Uh oh, #{job['class']} #{job["jid"]} just died with error #{ex.message}."
      UsersMailer.notification_admin_email.deliver_later
    end
  end

  Sidekiq.configure_client do |config|
    config.redis = {url: "redis://localhost:6379/0"}
  end