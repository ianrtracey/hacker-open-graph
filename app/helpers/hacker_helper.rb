module HackerHelper
	require 'net/http'

	def external_profile_link_is_valid(profile_link)
		if ["http://", ""].include?(profile_link.strip)
			return false
		end
		return true 
	end

	def is_favorited_by_current_user?(hacker)
		return current_user.favorites.include?(hacker)
	end

end
