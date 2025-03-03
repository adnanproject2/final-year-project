namespace :daily_reminder do
    desc "Send Daily Reminder"
    task send: :environment do
      @accounts = Account.where(active: 1)

      if @accounts.present?
        @accounts.each do |account|
            @tasks = account.tasks.for_today.pending
            TaskNotifyMailer.daily_reminder(account, @tasks).deliver
        end
      end
    end
  end
  