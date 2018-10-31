# Fakebook

[![Build Status](https://semaphoreci.com/api/v1/andrewr224/fakebook/branches/master/badge.svg)](https://semaphoreci.com/andrewr224/fakebook)

### This is the final project from [Odin Project](https://www.theodinproject.com), the best code school on the internet

## You can check it on [Heroku](https://shielded-shelf-45678.herokuapp.com/)

## Ramp up
```sh
$ git clone git@github.com:andrewr224/facebook.git
$ cd fakebook
$ bundle install
$ rails db:setup
$ rails s
```

## Testing
```sh
$ bundle exec rake parallel:setup
$ bundle exec rake parallel:spec
```

## I'm intended to use this project as a playground for cool stuff
* [Trailblazer](http://trailblazer.to/)
* [Falcon](https://github.com/socketry/falcon)
* [Webpacker](https://github.com/rails/webpacker)
* [Encrypting User Email](https://ankane.org/securing-user-emails-in-rails/)
* [Action Text](https://github.com/rails/actiontext)
* [Parallel Tests](https://github.com/grosser/parallel_tests)

### TODO:
* Implement simple authentication with Sorcery and Trailblazer
* Add user profile
* Add user posts with actiontext
* Add user news (posts index)
* Add style to the project
* Populate Fakebook with fake users
* Create jobs to add new user posts (and remove old ones
* Implement Falcon server
* Switch from sprockets to webpacker
* Encrypt user emails
