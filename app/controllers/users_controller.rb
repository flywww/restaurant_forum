class UsersController < ApplicationController

  def show
    @user = current_user
    @commented_restaurants = removeReapeatObjects(@user.restaurants)
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

  def removeReapeatObjects(objects)
    @sortingObjects = objects.sort_by {|obj| obj.id}
    @nonReapeatObjects =  []
    for i in 0...(@sortingObjects.length-1)
        if @sortingObjects[i].id != @sortingObjects[i+1].id
          @nonReapeatObjects.push(@sortingObjects[i])
        end    
    end
    @nonReapeatObjects
  end
end
