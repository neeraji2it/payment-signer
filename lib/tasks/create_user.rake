namespace :db do
  namespace :seed do
    desc "seed User information"
    task :user => :environment do
      15.times do |i|
        User.create!(email: ENV["USER_#{i+1}_EMAIL"], password: ENV["USER_#{i+1}_PASSWORD"], password_confirmation: ENV["USER_#{i+1}_PASSWORD"])
      end

      p "created user successfully!"
    end
  end
end