class HomeController < SecuredController
    def index

      @tasks = @account.tasks
      @today_tasks = @tasks.for_today
      @completed_tasks_data = @today_tasks.where(status: 1)
      @pending_tasks_data = @today_tasks.where(status: 0)

     # Todays Tasks
      @today_tasks_data = 
         {
            "Total Tasks" => @today_tasks.count || 0,
            "Completed Tasks" => @completed_tasks_data.count || 0,
            "Pending Tasks" => @pending_tasks_data.count || 0
        }

        @today_tasks_priority_data = 
         {
            "Urgent & Important" => @today_tasks.urgent_and_important.count || 0,
            "Urgent but not Important" => @today_tasks.urgent_but_not_important.count || 0,
            "Important but not Urgent" => @today_tasks.important_but_not_urgent.count || 0,
            "Neither urgent nor Important" => @today_tasks.neither_urgent_nor_important.count || 0,
            "Not Prioritized yet!" => @today_tasks.no_priority_set.count || 0
        }

        # Weekly Progress
        @weekly_tasks = @tasks.this_week
        @completed_weekly_tasks_data = @weekly_tasks.where(status: 1)
        @pending_weekly_tasks_data = @weekly_tasks.where(status: 0)


        @weekly_tasks_data = 
        {
           "Total Tasks" => @weekly_tasks.count || 0,
           "Completed Tasks" => @completed_weekly_tasks_data.count || 0,
           "Pending Tasks" => @pending_weekly_tasks_data.count || 0
       }

        # Monthly Progress
        @monthly_tasks = @tasks.this_month
        @completed_month_tasks_data = @monthly_tasks.where(status: 1)
        @pending_month_tasks_data = @monthly_tasks.where(status: 0)


        @monthly_tasks_data = 
        {
           "Total Tasks" => @monthly_tasks.count || 0,
           "Completed Tasks" => @completed_month_tasks_data.count || 0,
           "Pending Tasks" => @pending_month_tasks_data.count || 0
       }

    #    Performance
        @performance_completed_tasks = @tasks.this_month.completed

        @performance_pending_tasks = @tasks.this_month.pending

        @performance_chart_data = 
        {
           "" => @performance_pending_tasks.count || 0,
           set_performance => @performance_completed_tasks.count || 0
       }

    end

    private
    def set_performance
        if @performance_pending_tasks.count == 0 && @performance_completed_tasks.count > 0
          "Excellent Performance"
        elsif @performance_pending_tasks.count == @performance_completed_tasks.count
          "Average Performance"
        elsif @performance_pending_tasks.count > @performance_completed_tasks.count
          "Poor Performance"
        elsif @performance_pending_tasks.count < @performance_completed_tasks.count
          "Good Performance"
        end
    end
end