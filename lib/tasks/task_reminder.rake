namespace :task_reminder do
    desc "Send Reminder"
    task send: :environment do
       t = Task.last 
       t.title = rand(100)
       t.save
    end
end
