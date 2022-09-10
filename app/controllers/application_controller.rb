class ApplicationController < ActionController::Base
  before_action :check_login
  helper_method :author?

  private

  def check_login
    unless session[:author].present?
      redirect_to root_path
    end
  end

  def author?
    session[:author].present?
  end
end
