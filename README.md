# How to setup

This web API is developed by using Ruby on Rails and PostgreSQL database.

## Install Ruby on Rails and PostgreSQL ##
In this assignment, I use Ruby version 2.4.0 and Rails version 5.0.3

So you will need to setup Ruby on Rails environment and the database depending on your version of operating system as described in the link below.

https://gorails.com/setup/ubuntu/16.04#ruby

*Note: You don't need to setup PostgreSQL with username and password!!


Once you setup the environment.
```
Check your setup in terminal

ruby -v

rails -v
```

## Assignment installation ##
Clone the project and get into api-assigment directory.

```
bundle install

rails db:create

rails db:migrate

rails server
```

Then, you are good to go.
