module HackerHelper
	require 'net/http'

	def external_profile_link_is_valid(profile_link)
		return true 
	end

	def is_favorited_by_current_user?(hacker)
		return current_user.favorites.include?(hacker)
	end

end
