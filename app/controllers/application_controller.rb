class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
   before_action :set_current_user
 

   def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
   end
end
# 渡されたユーザーがログイン済みのユーザーであればtrueを返します。
  def current_user?(user)
    @user == current_user
  end
  