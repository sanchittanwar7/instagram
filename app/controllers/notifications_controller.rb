class NotificationsController < ApplicationController
	after_action :mark_read, only: [:show]
	def show
		@notifications = Notification.where(receiver_id: current_user.id).order('created_at desc')
	end

	def check
		@newNotification = Notification.where(receiver_id: current_user.id, read: false)[0]
		if @newNotification == nil
			render :nothing => true, :status => :ok
			return true
		end
	end

	def mark_read
		read_notifications = Notification.where(receiver_id: current_user.id, read: false)
		read_notifications.each do |swap_read|
			swap_read.read = true
			swap_read.save
		end
	end
end
