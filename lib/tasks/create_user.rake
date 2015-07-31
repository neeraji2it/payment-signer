namespace :db do
  namespace :seed do
    desc "seed User information"
    task :user => :environment do

      User.create!(email: 'rails@rising-sun.com', password: 'dine-media12345', password_confirmation: 'dine-media12345')

      p "created user successfully!"
    end

    desc "seed admin information"
    task :admin => :environment do
      AdminUser.find_or_create_by(email: 'admin@rising-sun.com', password: 'dine-media12345', password_confirmation: 'dine-media12345')
    end

    desc "update other user's information to fake password"
    task :update_password => :environment do
      users = User.where('email != ?', 'rails@rising-sun.com')
      user.map { |u| u.update(password: 'some fake password', password_confirmation: 'some fake password')}
    end
  end
end
