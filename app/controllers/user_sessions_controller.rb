
class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to :root, notice: t('Logged on')  
    else
			flash[:alert] = t('Login failed')
      render :action => :new
#      redirect_to :login, notice: t('Login failed')  
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to :root
  end
end
