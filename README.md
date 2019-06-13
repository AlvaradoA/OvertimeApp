# Overtime App

## Key requirement: Company needs documentation that salaried employess did or did not get overtime each week


## Models
  - Post -> date:date rationale:text
  - User -> Devise
  - AdminUser -> STI

## Features:
  - Approval workflow - when post is created admin may approve it
  - SMS messages - link to approval or overtime input
  - Admin dashboard - administrate
  - Email summary to admin users / managers for approval
  - Need documentation for no overtime

## Libraries:
  - Devise -> user authentication
  - Administrate -> manage admin dashboard
  - Bootstrap -> styling/ formatting
  - Twilio -> sms message sending
  - Dotenv -> protect credentials
  - Rspec -> testing
  - Capybara -> integration testing
