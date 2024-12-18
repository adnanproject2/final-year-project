class SecuredController < ApplicationController
    before_action :authenticate_user! , :set_globals

    private 
    def set_globals
        @user = current_user 
        @account = @user.account 
    end
end