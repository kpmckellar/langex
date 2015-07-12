module MessagesHelper
  # def recipients_options(chosen_recipient = nil)
  #   s = ''
  #   User.all.each do |user|
  #   s << "<option value='#{user.id}' data-img-src='#{avatar_for(user, size = 30, title = user.first_name)}' #{'selected' if user == chosen_recipient}>#{user.first_name}</option>"
  # end
  #   s.html_safe
  # end

    def recipients_options
	    s = ''
	    User.all.each do |user|
	      s << "<option value='#{user.id}' data-img-src='#{avatar_for(user, size: 50)}'>#{user.first_name}</option>"
	    end
	    s.html_safe
	end

end