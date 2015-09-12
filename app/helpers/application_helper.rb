module ApplicationHelper
	def avatar_for(user, size = 30, title = user.first_name)
		image_tag(user.avatar.url(:thumb), class: 'img-rounded')
	end

	def page_header(text)
  		content_for(:page_header) { text.to_s }
	end
end
