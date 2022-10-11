# frozen_string_literal: true

# User resource routes
class UsersController < ApplicationController
  def update
    current_user.assign_attributes(resource_params)

    if current_user.save
      flash[:success] = 'Profile saved'
    else
      flash[:danger] = 'Error saving profile'
    end
    redirect_back_or_to profile_path
  end

  private

  def resource_params
    params.require(:user).permit(
      :first_name,
      :last_name
    )
  end
end
