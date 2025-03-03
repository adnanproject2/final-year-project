class TaskNotifyMailer < ApplicationMailer
    default :from => ENV['postmark_signature']
 
    def task_reminder(task)
      @task = task
      @account = @task.account
      @user = @account.users.last
      @priority = set_priority(task) 
      @category = task.category.present? ? task.category.name : nil
      @url  = app_url
      @task_url = task_url.gsub("{id}", @task.id.to_s)
      @app_name = app_name

      @task.email_histories.build.save
      mail(:to => @account.account_email, :subject => "TaskReminder: #{@task.title}")
      # mail(:to => "harisishfaq07@gmail.com", :subject => "TaskReminder: #{@task.title}")
    end

    def daily_reminder(account, tasks)
      @account = account
      @user = @account.users.last
      @tasks = tasks
      @url  = app_url
      @app_name = app_name
      @task_url = "#{app_url}/tasks"
      @add_task_url = "#{app_url}/tasks/new"
      @account.email_histories.build.save
      mail(:to => @account.account_email, :subject => "TaskReminder: Making your day productive.")
    end


    private 
    def set_priority(obj)
      case obj.priority 
      when '3'
        'Urgent & Important'
      when '2'
        'Urgent but not Important'
      when '1'
        'Important but not Urgent'
      when '0'
        'Neither urgent nor Important'
      else
        "Not Prioritized!"
      end
    end

    def app_url
      "https://taskreminder-f0cde1568d91.herokuapp.com"
    end

    def task_url 
      "https://taskreminder-f0cde1568d91.herokuapp.com/tasks/{id}/edit"
    end

    def app_name 
      "TaskReminder"
    end
end
