class Status < ActiveRecord::Base
	belongs_to :hacker


	def confirm
		self.update_attribute(:decision => Decision::CONSTANTS['CONFIRM'])
	end

	def decline
		self.update_attribute(:decision => Decision::CONSTANTS['DECLINE'])
	end
end
