class SessionsController < ApplicationController

  def new
    # @user=User.find_by(params[:id])
  end


  def create
    @user=User.find_by(username:params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id]=@user.id
      redirect_to user_path(@user)
    else
      flash[:message]='User Not Found'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end


end
