class SessionsController < ApplicationController
    def new
    
    end
    
    def create
        #debugger
        @user = User.find_by_user_id params[:user][:user_id]
        if @user == nil or @user.email != params[:user][:email]
            flash[:warning] = "Invalid user-id/e-mail combination."
            redirect_to login_path
        else #success
            session[:session_token] = @user.session_token
            redirect_to movies_path
        end
    end
    
    def destroy
        session[:session_token] = nil
        redirect_to movies_path
    end
end