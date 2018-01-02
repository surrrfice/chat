module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end#current_user　methodはUser modelをsesstionに格納されたuser_idで検索している

  def logged_in?
    current_user.present?
  end
  def log_in(user)
      callback = session[:callback]
      reset_session
      session[:user_id] = user.id
      session[:callback] = callback
      cookies.permanent.signed[:user_id] = user.id
    end

 def log_out
  reset_session
  @current_user = nil
 end
end
