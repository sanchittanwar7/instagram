class HomeController < ApplicationController
	before_action :authenticate_user!
	def index
		@posts = Post.all.order('created_at desc')
		@follows = Follow.where(follower: current_user.id)
		@comments = Comment.all
	end
end
