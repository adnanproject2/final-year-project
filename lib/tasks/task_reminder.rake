# namespace :task_reminder do
#     desc "Send Reminder"
#     task send: :environment do
#       cron_time = 10.minutes
#       from_time = (Time.now.utc - cron_time).change(sec: 0, usec: 0)
#       to_time = Time.now.utc.change(sec: 0, usec: 0)
  
#       @tasks = Task.for_today.pending.select do |task|
#         task_time = Time.parse("#{task.date} #{task.time} UTC") rescue nil
#         task_time && task_time.between?(from_time, to_time)
#       end
      
#       if @tasks.any?
#         @tasks.each do |task|
#           TaskNotifyMailer.task_reminder(task).deliver_now
#         end
#       end
#     end
#   end
  

namespace :task_reminder do
  desc "Send Reminder"
  task send: :environment do
    Time.zone = 'London'  # Set to UK time zone

    cron_time = 10.minutes
    from_time = (Time.zone.now - cron_time).change(sec: 0, usec: 0)
    to_time = Time.zone.now.change(sec: 0, usec: 0)

    @tasks = Task.for_today.pending.select do |task|
      task_time = Time.zone.parse("#{task.date} #{task.time}") rescue nil
      task_time && task_time.between?(from_time, to_time)
    end

    if @tasks.any?
      @tasks.each do |task|
        TaskNotifyMailer.task_reminder(task).deliver_now
      end
    end
  end
end
