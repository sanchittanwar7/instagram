class LikesController < ApplicationController
	def toggle
		@post = params[:post]
		
		if params[:isLiked].eql?"true"
			like = Like.where(user_id: current_user.id, post_id: @post)[0]
			
			like.destroy
			@isLiked = "false"
		else
			Like.create(user_id: current_user.id, post_id: @post)
			@isLiked = "true"
		end	
					

		@count = Like.where(post_id: @post).count
		respond_to do |format|
			format.js{ }
		end
	end
end

