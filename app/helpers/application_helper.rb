module ApplicationHelper
    def active_class(link_path)
        current_page?(link_path) ? "active" : ""
    end

    def email_against(obj)
        
        if obj.task.present?
            "<a href='/tasks/#{obj.task_id}/edit' style='font-style: italic; color: grey;'>Task</a>".html_safe
        else
            "Account"
        end
    end

    def reminds_at(obj)
       obj.created_at.strftime('%d-%m-%Y at %I:%M %p')
    end
end
