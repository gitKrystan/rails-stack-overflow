# Stack Overflow Clone

##### By Krystan Menne and Patrick Sullivan

This sample Rails app demonstrates user authentication (using Bcrypt). Accounts are confirmed via email. Once logged in, users ask and answer questions.

Features:
* Testing with RSpec, ShouldMatchers, FactoryGirl, Capybara, and Selenium

## Prerequisites
* Ruby 2.2.2 or greater
* Rails 4.2.6 or greater
* PostgreSQL
* Selenium Webdriver

## Installation
1. `$ git clone` this repository
1. Change into the new directory
1. `$ bundle install`
1. Create database and run migrations
  1. `$ rake db:create`
  1. `$ rake db:migrate`
  1. `$ rake db:test:prepare`
1. Run the tests (see below)

## Running / Development
1. `$ rails serve`
1. Visit your app at [http://localhost:3000](http://localhost:3000).

## Running Tests
`$ rspec`

## License
Copyright (c) 2016 Krystan Menne and Patrick Sullivan
This software is licensed under the MIT license.
