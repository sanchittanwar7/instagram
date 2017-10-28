class HomeController < ApplicationController
	before_action :authenticate_user!
	def index
		@posts = Post.all
		@follows = Follow.where(follower: current_user.id)

	end
end
