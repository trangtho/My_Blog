require "rails_helper"

RSpec.describe UsersMailer, type: :mailer do
  describe '.notification' do
    let!(:user) { FactoryBot.create :user }

    it 'send email by sidekiq' do
      perform_enqueued_jobs do
        UsersMailer.notification_email(user.id).deliver_later
      end

      mail = ActionMailer::Base.deliveries.last
      expect(mail.subject).to eq 'notification email'
      expect(mail.from).to eq ['no-reply@livedevs.com']
      expect(mail.to).to eq [user.email]
    end
    it 'retries the job according to retry options' do
      perform_enqueued_jobs do
        UserJob.perform_async(user.id)
      end
      
      # Check that the job has been enqueued
      expect(UserJob.jobs.size).to eq(1)
      
    end
  end

  describe '.notification_admin_email' do
    let!(:admin) { FactoryBot.create :user, role: 'Admin' }

    it 'sends notification to admin email' do
      perform_enqueued_jobs do
        UsersMailer.notification_admin_email.deliver_later
      end

      mail = ActionMailer::Base.deliveries.last
      expect(mail.subject).to eq 'Notification failed background jobs'
      expect(mail.from).to eq ['no-reply@livedevs.com']
      expect(mail.to).to eq [admin.email]
    end
    

  end

  
end
