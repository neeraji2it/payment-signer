ActionMailer::Base.smtp_settings = {
    address:              "smtp.mandrillapp.com",
    port:                 587,
    enable_starttls_auto: true,
    user_name:            'neeraji2it@gmail.com',
    password:             'aKHy0cc8VGSpfxPKCJsD3A',
    authentication: "login"
   }
 ActionMailer::Base.delivery_method = :smtp
 ActionMailer::Base.default charset: 'utf-8'
