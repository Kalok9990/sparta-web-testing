# Capybara

Capybara helps you test web applications by simulating how a real user would interact with your app. It is agnostic about the driver running your tests and comes with Rack::Test and Selenium support built in. WebKit is supported through an external gem.

## About the Repository

There are two files that shows the basics of using Capybara and how it works with OOP. The folder contains an exercise that I did to practice and further my knowledge of using Capybara with rspec. This was done by testing the BBC website sign up and sign in pages, where you start from the BBC homepage.

Not all tests have been made as there was time limit, but I have managed to test the more important aspects. An error was seen where when inputing the dates for signing up, the number '3' was not allowed to be input through automation, so that could be something that could be brought up to the BBC.

## Setup

Requires gem installation of capybara

```
gem install capybara
```

In the file, you will need to require it as well.

```Ruby
require 'capybara'
```

## Before Use

When using the repository, for the folder, within the file 'bbc_signup_success_spec.rb', change the email before running as rspec as the previous email has most likely been used already to test if the sign up works.
