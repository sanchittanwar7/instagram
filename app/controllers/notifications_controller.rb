class NotificationsController < ApplicationController
	after_action :mark_read, only: [:show]
	def show
		@notifications = Notification.where(receiver_id: current_user.id).order('created_at desc')
		@comments = Comment.all.order('created_at desc')
		@replies = Reply.all.order('created_at desc')
		@likes = Like.all
	end

	def check
		@newNotification = Notification.where(receiver_id: current_user.id, read: false)[0]
		if @newNotification == nil
			render :nothing => true, :status => :ok
			return true
		end
	end

	def show_post 
		@comments = Comment.all.order('created_at desc')
		@replies = Reply.all.order('created_at desc')
		@likes = Like.all
		@post = Post.where(id: params[:post])[0]
		byebug
	end

	def mark_read
		read_notifications = Notification.where(receiver_id: current_user.id, read: false)
		read_notifications.each do |swap_read|
			swap_read.read = true
			swap_read.save
		end
	end
end
