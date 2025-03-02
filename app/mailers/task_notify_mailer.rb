class TaskNotifyMailer < ApplicationMailer
    default :from => ENV['postmark_signature']
 
    def task_reminder(user)
      @user = user
      @url  = "http://example.com/login"
      mail(:to => 'harisishfaq07@gmail.com', :subject => "Welcome to My Awesome Site")
    end
end
