class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  helper_method :current_user 


  private
  def current_user
    # if @id.exist?
    #   @current_user = @id
  	# @current_user ||= User.find(session[@user_id]) if session[:user_id]
  	# puts current_user
    # end find(session[:user_id]) if session[:user_id]
    @current_user ||= @user_id
    # @current_user ||= User.where(id: session[:user_id]).first
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # def current_id
  # 	@current_id ||= request.original_url
  # 	puts @current_id
  # end
end
