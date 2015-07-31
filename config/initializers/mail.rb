ActionMailer::Base.smtp_settings = {
    address:              "smtp.gmail.com",
    port:                 587,
    enable_starttls_auto: true,
    user_name:            'service.bluearchstore@gmail.com',
    password:             'Brother!@#$5',
    authentication:       'plain',
    enable_starttls_auto: true
  }
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: 'utf-8'
