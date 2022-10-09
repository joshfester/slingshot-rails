class UsersController < ApplicationController

  def show 

  end

  def update 
    current_user.assign_attributes(resource_params)

    if current_user.save
      flash[:success] = 'Profile saved'
      redirect_back_or_to profile_path
    else
      flash[:danger] = 'Error saving profile'
      redirect_back_or_to profile_path
    end
  end

  private

  def resource_params
    params.require(:user).permit(
      :first_name,
      :last_name
    )
  end

end