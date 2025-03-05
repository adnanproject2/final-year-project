class EmailHistoriesController < SecuredController

    def index 
        @emails = @account.email_histories
    end

    def delete_all 
        begin
            @emails = @account.email_histories
            if @emails.delete_all
              flash[:notice] = 'History cleared successfully'
              redirect_back(fallback_location: root_path)
            end
          rescue => exception
            flash[:alert] = exception.message
            redirect_back(fallback_location: root_path)
          end
    end
end
  