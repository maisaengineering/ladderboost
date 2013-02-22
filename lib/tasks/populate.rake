namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
   #[User].each(&:delete_all)
    
    User.populate 5 do |person|
      person.email    = Faker::Internet.email
      person.encrypted_password = 'password'
      
    end
    Profile.populate 5 do |profile|
      profile.first_name    = Faker::Name.first_name
      profile.last_name     = Faker::Name.last_name
      profile.city     = Faker::Address.city
      profile.state     = Faker::Address.us_state
      profile.country     = Faker::Address.uk_country


    end
  end
end