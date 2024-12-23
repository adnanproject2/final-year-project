class TasksController < SecuredController

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

    private
    def task_params 
      params.require(:task).permit(:title, :priority, :date, :time, :note, :status)
    end
end
