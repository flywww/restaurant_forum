class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path
      flash[:notice] = "user was successfully updated"
    else
      render :edit
      flash[:alert] = "user was failed to update"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :intro, :avatar)
  end

end
