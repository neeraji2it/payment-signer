namespace :db do
  namespace :seed do
    desc "seed User information"
    task :user => :environment do
      # 15.times do |i|
      #   User.create!(email: ENV["USER_#{i+1}_EMAIL"], password: ENV["USER_#{i+1}_PASSWORD"], password_confirmation: ENV["USER_#{i+1}_PASSWORD"])
      # end
      User.create!(email: ENV["USER_1_EMAIL"], password: ENV["USER_1_PASSWORD"], password_confirmation: ENV["USER_1_PASSWORD"])

      p "created user successfully!"
    end

    desc "seed admin information"
    task :admin => :environment do
      AdminUser.find_or_create_by(email: ENV["ADMIN_EMAIL"], password: ENV["ADMIN_PASSWORD"], password_confirmation: ENV["ADMIN_PASSWORD"])
    end
  end
end