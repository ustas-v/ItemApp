ItemApp
=======

bundle install

bundle exec rake db:migrate

bundle exec rake db:test:prepare

bundle exec rspec spec/

bundle exec rails server
