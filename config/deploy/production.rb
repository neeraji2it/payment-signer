role :app, %w{root@63.142.251.176}
role :web, %w{root@63.142.251.176}
role :db,  %w{root@63.142.251.176}
server '63.142.251.176', user: 'root', roles: %w{web app db} #, my_property: :my_value

set :domain, '63.142.251.176'
set :deploy_to, '/var/www/payment-signer.com/public_html'
set :branch, 'master'
set :deploy_user, 'root'
set :log_level, :debug
set :rails_env, 'production'
