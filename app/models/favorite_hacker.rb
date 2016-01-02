class FavoriteHacker < ActiveRecord::Base
	belongs_to :hacker
	belongs_to :user
end
