module ApplicationHelper
    def active_class(link_path)
        current_page?(link_path) ? "active" : ""
    end

    def email_against(obj)
        
        if obj.task.present?
            "<a href='/tasks/#{obj.task_id}/edit' style='color: #2880b9;'><i class='linkify icon'></i> Task</a>".html_safe
        else
            "Account"
        end
    end

    def reminds_at(obj)
        if obj.task.present?
            time =  Time.parse(obj.task.time).strftime("%I:%M %p") 
            day = obj.created_at.strftime('%d-%m-%Y')
            "#{day} at #{time}"
        else
            obj.created_at.strftime('%d-%m-%Y at %I:%M %p')
        end
    end
end
