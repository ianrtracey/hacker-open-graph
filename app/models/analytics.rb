class Analytics < ActiveRecord::Base

	def top_schools
		[get_sum(self.schools_stats), self.schools_stats.slice(0..5)]
	end

	def add_languages(languages)
		puts languages
		if self.github_stats.nil?
			self.github_stats = {}
		end
		languages.each do |key, val|
			key.each do |k, v|
				puts " #{k} : #{v}"
				if self.github_stats.has_key?(k)
					self.github_stats[k] = self.github_stats[k] + v
				else
					self.github_stats[k] = v
				end
			end
			

		end
	end

private
	def get_sum(schools)
		return schools.collect { |x| x[1]}.reduce(:+)
	end
end
