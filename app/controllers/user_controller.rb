class UserController < ApplicationController
  autocomplete :user, :username

  def profile
  	username = params["username"]
  	@userdetail = User.find_by_username(username)

    if @userdetail
    else
      redirect_to '/' and return

    end
    @posts = Post.where(user_id: @userdetail.id)
  end
  def remove_profile_pic
    current_user.remove_profile_pic!
    current_user.save
    redirect_to edit_user_registration_path
  end
end
