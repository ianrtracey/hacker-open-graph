class Hacker < ActiveRecord::Base
	has_one :status, dependent: :destroy
	has_one :stat
	after_create :create_status, :create_stat
	before_update :send_decision

	has_many :favorite_hackers
	has_many :favorited_by, through: :favorite_hackers, source: :user

	def 

	def approve
		@status = self.status
		@status.update_attribute(:status, Decision::CONSTANTS['APPROVE'])
		generate_invitation(status)
		decision_made(status)
	end

	def generate_invitation(status)
		status.update_attribute(:invitation_key, SecureRandom.uuid)
		status.update_attribute(:invitation_sent_at, Time.now)

	end

	def reject
		@status = self.status
		@status.update_attribute(:status, Decision::CONSTANTS['REJECT'])
		decision_made(status)
	end

	def waitlist
		@status = self.status
		@status.update_attribute(:status, Decision::CONSTANTS['WAITLIST'])
		decision_made(status)

	end


	def create_status
		self.status = Status.new
	end

	def create_stat
		self.stat = Stat.new
	end

	def send_decision
		if self.status.status_changed? && self.status.status == Decision::CONSTANTS['APPROVE']
			self.status.invitation_sent_at = Time.now
		end
	end

	def logger
		@logger ||= Logger.new("#{Rails.root}/log/hacker.log")
	end

	def decision_made(status)
		status.update_attribute(:decision_made_at, Time.now)
		@hacker = Hacker.find(status.hacker_id)
		logger.info("hacker [#{@hacker.id}] -- #{@hacker.email} has been #{status.status}")
	end

	
	
end
