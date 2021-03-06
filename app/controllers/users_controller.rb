class UsersController < ApplicationController

  def index
    @users=User.all
  end

  def show

    @user=current_user
  end

  def new
    @user=User.new
  end

  def create

    @user=User.new(user_params)
    @user.save
    redirect_to @user
    # else
    #   render :new
    # end
  end


  private

    def user_params
      params.require(:user).permit(:username,:password)
    end



end
