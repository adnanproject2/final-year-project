# Preview all emails at http://localhost:3000/rails/mailers/task_notify_mailer
class TaskNotifyMailerPreview < ActionMailer::Preview
    def task_reminder()
        TaskNotifyMailer.task_reminder(Task.last)
    end 

    def daily_reminder()
        TaskNotifyMailer.daily_reminder(Account.last, Account.last.tasks)
    end
end
