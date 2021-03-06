# Fakebook

[![Build Status](https://semaphoreci.com/api/v1/andrewr224/fakebook/branches/master/badge.svg)](https://semaphoreci.com/andrewr224/fakebook)

### This is the final project from [Odin Project](https://www.theodinproject.com), the best code school on the internet

## You can check it on [Heroku](https://fake-book-app.herokuapp.com/users/new)

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
* [Trailblazer](http://trailblazer.to)
* [Falcon](https://github.com/socketry/falcon)
* [Encrypting User Email](https://ankane.org/securing-user-emails-in-rails)
* [Action Text](https://github.com/rails/actiontext)
* [Parallel Tests](https://github.com/grosser/parallel_tests)

### TODO:
* Add user friends
* Refine user news to show only friends posts [?]
* Implement Actiontext
* Populate Fakebook with fake users
* Create jobs to add new user posts (and remove old ones)
* Add user likes
* Add user comments (maybe post subclass)
* Add pagination
* Encrypt user emails
* Implement Falcon server

### DONE:
* Add messages
* Add policy
* Add user edit
* Add style to the project
* Improve Post#index to use partial cells
* Squeeze signin and signup onto one page
* Add user news (posts index)
* Add user posts
* Add user profile
* Implement simple authentication with Sorcery and Trailblazer

## Notes on the technologies I've used
[Trailblazer](http://trailblazer.to/). To begin with, I'm eager to try it with something other than Rails.
As it is, I'm a good deal disappointed with Trailblazer + Rails combo. I might have been just lucky enough to have used versions of Rails and Trailblazer that are incompatible, but I've experienced bugs on every stage of the implementation, and it felt too much like hacking to my licking.
