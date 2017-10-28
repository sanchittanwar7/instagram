class FollowController < ApplicationController
	def toggle
		doesExist = Follow.where(follower: current_user.id, followee: params[:profile])[0];
		if(doesExist)
			doesExist.destroy;
			@text = "Follow"

		elsif 
			follow = Follow.create(follower: current_user.id, followee: params[:profile])
			# @followerCount = Follow.where(followee: params[:profile]).count ;
			@text = "Following"
		end


		if Follow.where(followee: params[:profile])
			@followerCount = Follow.where(followee: params[:profile]).count 
		elsif 
			@followerCount = 0
		end

		respond_to do |format|
			format.js { }
		end

	end
end
