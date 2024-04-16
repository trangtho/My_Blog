ActionMailer::Base.smtp_settings = {
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'],
    domain: ENV['DB_HOST'],
    address: ENV['SG_ADDRESS'],
    port: ENV['SG_PORT'],
    authentication: :plain,
    enable_starttls_auto: true
}

