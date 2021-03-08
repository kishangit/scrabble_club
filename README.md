# README

bundle install
npm install
rails db:migrate
rails db:seed


# README

Ruby - ruby 2.7.0

Rails - Rails 6.0.3.3

UI - Bootstrap(4.5)

Devise, Faker

# Validations:
1) Users first_name, last_name, email, phone should be present.
2) Match player_one, player_two, player_one_score, player_two_score, winner, loser should be present.

# Steps
Step 0: Clone the repo: <br />
Step 1: bundle install <br />
Step 2: npm install <br />
Step 3: rails db:setup <br />
Step 4: rails s <br />

# Additional functionalities
1) User login logout functionality
2) I have added is_administrator flag in users table first user is created with the is_administrator flag true.
3) Administrator can edit details of any user.
4) Test cases

# Test cases
I have implemented some basic unit tests for validation mentioned in the description.
run "rails test" in repository.