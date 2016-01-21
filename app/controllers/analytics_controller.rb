class AnalyticsController < ApplicationController

	def schools
		@schools = Analytics.find(1).top_schools
	end
end
