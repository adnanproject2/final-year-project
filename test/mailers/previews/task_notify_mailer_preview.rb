# Preview all emails at http://localhost:3000/rails/mailers/task_notify_mailer
class TaskNotifyMailerPreview < ActionMailer::Preview
    def task_reminder()
        TaskNotifyMailer.task_reminder("ff")
    end
end
