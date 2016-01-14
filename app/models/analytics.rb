class Analytics < ActiveRecord::Base

	def top_schools
		[get_sum(self.schools_stats), self.schools_stats.slice(0..5)]
	end

private
	def get_sum(schools)
		return schools.collect { |x| x[1]}.reduce(:+)
	end
end
