namespace :resume do
	require 'open-uri'

	task download_all: :environment do

		Hacker.all.reverse.each do |hacker|
			if !hacker.resume.nil?
				open(Rails.root+"app/assets/images/resumes/#{hacker.id}.pdf", 'wb') do |file|
					begin
	  				file << URI.parse(hacker.resume).read
	  				puts "#{hacker.id} parsed."
	  				rescue
	  					puts "Error reading URI"
	  				end
	  			end
			end
		end
	end
end
