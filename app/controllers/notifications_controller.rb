class NotificationsController < ApplicationController
	def show
		@notifications = Notification.all.order('created_at desc')
	end
	def check
		@newNotification = Notification.where(receiver_id: current_user.id, read: false)[0]
		if @newNotification == nil
			render :nothing => true, :status => :ok
			return true
		end
	end
end
