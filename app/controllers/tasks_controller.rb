class TasksController < SecuredController
  protect_from_forgery with: :null_session

    def index
      today_date = Date.today

      # All Tasks Tab
      @all_tasks = @account.tasks
      @all_completed_tasks = @all_tasks.completed
      @all_pending_tasks = @all_tasks.pending

      # Today Tasks Tab
      @today_tasks = @all_tasks.for_today
      @today_completed_tasks = @today_tasks.completed
      @today_pending_tasks = @today_tasks.pending

      # Upcoming Tasks Tab
      @upcoming_tasks = @all_tasks.for_upcoming

      @export_file_data = @today_tasks.map do |task|
        {
          title: task.title,
          note: task.note,
          date: task.date,
          time: Time.strptime(task.time, "%H:%M").strftime("%I:%M %p"),
          priority: task_priority(task.priority),
          category: task_category(task),
          status: task_status(task)
        }
      end

      
      respond_to do |format|
        format.js
        format.html
        format.xlsx {
            response.headers['Content-Disposition'] = "attachment; filename=Todays-Task-#{Date.today}.xlsx"
        }
      end
    end

    def new 
      @task = Task.new
    end

    def create 
      begin
        @task = @account.tasks.build(task_params)
        if @task.save
          flash[:notice] = 'Task Added Successfully'
          redirect_back(fallback_location: root_path)
        end
      rescue => exception
        flash[:alert] = exception.message
        redirect_back(fallback_location: root_path)
      end
    end

    def edit 
      @task = Task.find(params[:id])
    end

    def update
      begin 
        @task = Task.find(params[:id])
        @task.update(task_params)
        flash[:notice] = 'Task Updated Successfully'
        redirect_back(fallback_location: root_path)
      rescue => exception
        flash[:alert] = exception.message
        redirect_back(fallback_location: root_path)
      end
    end

    def task_status
      begin 
        @task = @account.tasks.find_by_id(params[:task_id])
        @task.toggle(:status).save
      rescue => exception
      end
    end

    def destroy
      begin 
        @task = Task.find_by_id(params[:id])
        @task.destroy
        flash[:notice] = 'Task Deleted Successfully'
        redirect_back(fallback_location: root_path)
      rescue => exception 
        flash[:alert] = exception.message
        redirect_back(fallback_location: root_path)
      end
    end
    private
    def task_params 
      params.require(:task).permit(:title, :priority, :date, :time, :note, :status, :category_id)
    end

    def task_priority obj
      case obj 
      when '3'
        'Urgent & Important'
      when '2'
        'Urgent but not Important'
      when '1'
        'Important but not Urgent'
      when '0'
        'Neither urgent nor Important'
      else
        "-"
      end
    end

    def task_category obj
      if obj.category.present?
        obj.category.name 
      else
        '-'
      end
    end

    def task_status obj
      obj.status == 1 ? 'Completed' : 'Pending'
    end
end
