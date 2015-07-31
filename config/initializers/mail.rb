ActionMailer::Base.smtp_settings = {
    address:              "smtp.mandrillapp.com",
    port:                 587,
    enable_starttls_auto: true,
    user_name:            'rockingrails@gmail.com',
    password:             'IsYfBL-kdGwKOYIK3qfyzg',
    authentication: "login"
  }
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: 'utf-8'

# MandrillMailer.configure do |config|
#   config.api_key = ENV['MANDRILL_API_KEY']
# end
