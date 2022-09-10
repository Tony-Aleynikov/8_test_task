class SessionsController < ApplicationController
  skip_before_action :check_login, only: %i[new create]
  def new
    @author = session[:password]
  end

  def create
    password = params[:session][:password]

    if password == Rails.application.credentials.author_password
      session[:author] = true
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:author)
    redirect_to new_session_path
  end
end
