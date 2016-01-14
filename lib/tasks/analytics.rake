namespace :analytics do
	task schools: :environment do

	def inc_hash(hash, value)
		if hash.has_key?(value)
			hash[value] = hash[value]+1
		else
			hash[value] = 1
		end
		return hash
	end

	def print(schools)
		schools.each do |school|
			puts "#{school[0]} -- #{school[1]}"
		end
	end
		require 'swot'
		@hackers = Hacker.all
		schools = {}
		i = 0
		@hackers.each do |hacker|
			name = Swot::school_name hacker.email
			if !name.nil?
				if name.include?(',')
					name = name.split(',').first
				end	
				if name.include?("\n")
					name = name.split("\n")[1]
				end
					schools = inc_hash(schools, name.strip)
					i += 1
			end
		end

		schools_json = schools.sort_by {|k,v| v }.reverse.to_json

		if Analytics.all.count > 0
			@analytics = Analytics.find(1)
			@analytics.update_attribute(:schools_stats, schools_json)
		else
			Analytics.create(:schools_stats => schools_json)
		end
	end


end
