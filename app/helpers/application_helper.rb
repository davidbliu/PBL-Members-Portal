module ApplicationHelper
	# takes enumerable of groups and makes a comma separated string
	def group_string(groups)
		if groups.length == 0
			return "Anyone"
		else
			return groups.map{|x| x.name}.join(', ')
		end
	end

	def gravatar(email)
		if email.nil?
			email = 'asdf@gmail.com'
		end
		gravatar_id = Digest::MD5.hexdigest(email.downcase)
		return "http://gravatar.com/avatar/#{gravatar_id}.png"
	end
end
