namespace :sync do
  task execute: :environment do
require 'net/http'
require 'json'

def get_options_array(questions, answer, type)
	answers = []
	type_questions = questions.select{|x| x['group'] == "group_13632155" && x['question'].include?(type) }
	type_questions.each do |q|
		answers << answer[q['id']]
	end
	return answers.reject { |str| str.empty? } 
end

uri = URI('https://api.typeform.com/v0/form/C7QX2g?key=666784358a96968db6fe9195aaf3fc63571540c0&completed=true')
response = Net::HTTP.get(uri)

form = JSON.parse(response)
questions = form['questions']

form['responses'].each do |response|

	answer = response['answers']
	if !answer.nil?
	if !Hacker.exists?(:first_name => answer['textfield_13632184'],
		:last_name => answer['textfield_13632185'],
		:email => answer['email_13632193'],
		)
	Hacker.create(
		:first_name => answer['textfield_13632184'],
		:last_name => answer['textfield_13632185'],
		:email => answer['email_13632193'],
		:hireable => answer['yesno_13632174'] == "1" ? true : false,
		:returner => answer['yesno_13632569'] == "1" ? true : false,
 		:is_over_18 => answer['yesno_13632199'] == "1" ? true : false,
 		:gender => !answer['list_13632165_other'].empty? ? answer['list_13632165_other'] : answer['list_13632165_choice'],
 		:school => answer['textfield_13632159'],
 		:major => answer['textarea_13632171'],
 		:graduation_date => !answer['list_13632166_choice'].empty? ? answer['list_13632166_choice'] : answer['list_13632166_other'],
 		:learn => get_options_array(questions, answer, "learn"),
 		:experience => get_options_array(questions, answer, "experience"),
 		:num_of_hackathons => answer['number_13632164'],
 		:github => answer['website_13632176'],
 		:linkedin => answer['website_13632177'],
 		:resume => answer['fileupload_13632178'],
 		:require_travel_reimbursement => answer['yesno_13632175'] == "1" ? true : false,
 		:emergency_contact_name => answer['textfield_13632160'], 
 		:emergency_contact_number=> answer['textfield_13632161'])
	end
	end
end






end
end

