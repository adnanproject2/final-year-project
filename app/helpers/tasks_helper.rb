module TasksHelper
    def priorities 
        [
            ['Select Priority', nil],
            ['Urgent & Important', 3],
            ['Urgent but not Important', 2],
            ['Important but not Urgent', 1],
            ['Neither urgent nor Important', 0]
        ]
    end

    def statuses
        [
            ['Incompleted', 0],
            ['Completed', 1]
        ]
    end

    def task_status obj 
      obj.status == 0 ? 'Pending' : 'Completed'
    end

    def task_reminder obj 
    if obj.time.present?
        Time.parse(obj.time).strftime("%I:%M %p") 
    else
        'No reminder set'
    end
    end

    def task_note obj 
        obj.note.present? ? obj.note : '-'
    end

    def task_priority obj 
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
        "<span style='font-style: italic; color: grey;'>No Priority Set</span>".html_safe
      end
    end

    def task_priority_color obj 
      
        if obj.date < Date.today
          return 'active'
        end

        case obj.priority 
        when '3'
          'negative'
        when '2'
          'warning'
        when '1'
          'positive'
        when '0'
          ''
        else
          ''
        end
      end

      def task_status_color obj 
        if obj.date < Date.today 
          return 'active'
        end

        case obj.status 
        when 0
          'negative'
        when 1
          'positive'
        end
      end

      def task_day obj 
       obj.date.strftime('%d-%m-%Y (%A)')
      end
end
