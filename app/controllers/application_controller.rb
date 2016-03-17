class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  protect_from_forgery with: :exception

  private

    def current_user
        if session[:user_id]
          @current_user ||= User.find(session[:user_id])
        end
      end
    helper_method :current_user

    def authenticate_user!
      redirect_to login_path unless current_user
    end

    def authenticate_token!
       authenticate_or_request_with_http_token do |token, options|
         @api_user = User.find_by(api_token: token)
    end

    def show
         @post = Post.find(params[:id])
         respond_with @post
    end
end

end
