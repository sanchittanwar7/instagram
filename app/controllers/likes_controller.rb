class LikesController < ApplicationController
	def toggle
		@post = params[:post]
		
		if params[:isLiked].eql?"true"
			like = Like.where(user_id: current_user.id, post_id: @post)[0]
			
			like.destroy
			@isLiked = "false"
		else
			

			post = Post.where(id: @post)[0]
			user = post.user_id


			Notification.create(receiver_id: user, actor_id: current_user.id, statement: "likes your post", read: false, post_id: @post)
			Like.create(user_id: current_user.id, post_id: @post)
			@isLiked = "true"
		end	
					

		@count = Like.where(post_id: @post).count
		respond_to do |format|
			format.js{ }
		end
	end
end

