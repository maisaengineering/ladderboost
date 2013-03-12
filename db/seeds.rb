# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html

#   Mayor.create(name: 'Emanuel', city: cities.first)
#puts 'EMPTY THE MONGODB DATABASE'
#Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

puts 'DEFAULT USERS'
user = User.create! :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup, :roles => ['Admin']
puts 'user: ' << user.name

puts "----------  Creating 5 demo mentors"
(1..5).each do |e|
  User.create!(name: "mentor#{e}",email: "mentor#{e}@maisasolutions.com" ,roles: ['Mentor'],password: 'password',password_confirmation: 'password')
end
puts "------------------  DONE"
puts "----------  Creating 5 demo mentees"
(1..5).each do |e|
  User.create!(name: "mentee#{e}",email: "mentee#{e}@maisasolutions.com" ,roles: ['Mentee'],password: 'password',password_confirmation: 'password')
end
puts "------------------  DONE"

puts "################  Create Follow"
mentor1 = User.where(email: "mentor1@maisasolutions.com").first
mentor2 = User.where(email: "mentor2@maisasolutions.com").first
mentor3 = User.where(email: "mentor3@maisasolutions.com").first
mentor4 = User.where(email: "mentor4@maisasolutions.com").first
mentor5 = User.where(email: "mentor5@maisasolutions.com").first

puts "################  Create Follow"
mentee1 = User.where(email: "mentee1@maisasolutions.com").first
mentee2 = User.where(email: "mentee2@maisasolutions.com").first
mentee3 = User.where(email: "mentee3@maisasolutions.com").first
mentee4 = User.where(email: "mentee4@maisasolutions.com").first
mentee5 = User.where(email: "mentee5@maisasolutions.com").first

#mentor1 following mentees 1,2,5
mentor1.follow(mentee1,mentee2,mentee5)

#mentee1 following mentors 2,3,4
mentee1.follow(mentor2,mentor3,mentor4)







