class UserController < ApplicationController
  autocomplete :user, :username

  def profile
  	username = params["username"]
  	@userdetail = User.find_by_username(username)

    if @userdetail
    else
      redirect_to '/' and return

    end
    @users = User.all
    @posts = Post.where(user_id: @userdetail.id).order('created_at desc')
    @followers = Follow.where(followee: @userdetail.id)
    @followees = Follow.where(follower: @userdetail.id)
    @comments = Comment.all.order('created_at desc')
  end
  def remove_profile_pic
    current_user.remove_profile_pic!
    current_user.save
    redirect_to edit_user_registration_path
  end
end
