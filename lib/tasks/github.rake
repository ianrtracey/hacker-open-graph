namespace :github do
		client = Octokit::Client.new(:login => 'ianrtracey',:password => 'Filly901secure')
		user = client.user
		user.login
		puts "logged in #{user.name}"
		
	task languages: :environment do
		@hackers = Hacker.all
		github_names = []
		@hackers.each do |hacker|
			if !hacker.github.nil? && !hacker.github.split('/').last.nil? && !hacker.github.split('/').last.eql?("http:")
			# "#{hacker.first_name} #{hacker.last_name} -- #{hacker.github.split('/').last}"
			github_names << hacker.github.split('/').last
			end
		end

		puts github_names.count

		github_names.each do |github_name|
			begin
			user = client.user(github_name)
			puts user.name
			if !user.nil?
					repos = user.rels[:repos].get.data 
					puts repos.count
				if !repos.nil?
				languages = repos.map{ |r| r.rels[:languages].get.data }
				puts languages.to_h
				end
			end
			rescue
				puts "Error reaching username with Github API"
			end
		end
	end

	task avatars: :environment do
		Hacker.where.not(github: "http://").each do |hacker|
			if !hacker.github.nil? && !hacker.github.empty?
				begin
					user = client.user(hacker.github.split('/').last.strip.to_s)
					hacker.update_attribute(:avatar, user.avatar_url)
				rescue
					puts "github not found -- #{hacker.github.split('/').last.strip}"
				end
			end
		end

	end
end
