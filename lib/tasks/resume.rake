namespace :resume do
	require 'open-uri'

	task download_all: :environment do

		Hacker.all.reverse.each do |hacker|
			if hacker.resume.empty? || hacker.resume != "http://"
				open(Rails.root+"resumes/#{hacker.id}.pdf", 'wb') do |file|
	  				file << URI.parse(hacker.resume).read
	  			end
			end
		end
	end
end
