module ApplicationHelper
	def avatar_for(user, size = 30, title = user.first_name)
		image_tag(current_user.avatar.url(:thumb), class: 'img-rounded')
	end
end
