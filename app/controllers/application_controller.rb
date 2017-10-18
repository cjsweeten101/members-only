class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def log_in(user)
  	current_user= user
  	user.generate_remember_digest
  	user.save
  	cookies.permanent[:remember_token] = user.remember_digest 
  end

  def log_out(user)
  	current_user=nil
  	user.clear_remember_digest
  	cookies.clear
  end

  def current_user
  	@current_user ||= User.find_by(remember_digest: cookies.permanent[:remember_token])
  end

  def current_user=(user)
  	@current_user = user
  end

  def logged_in?
  	!current_user.nil?
  end
end
