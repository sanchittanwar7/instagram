class UserController < ApplicationController
  def profile
  	@posts = Post.where(user_id: current_user.id)
  end
  def remove_profile_pic
    current_user.remove_profile_pic!
    current_user.save
    redirect_to edit_user_registration_path
  end
end
