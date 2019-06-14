# Overtime App

## Key requirement: Company needs documentation that salaried employess did or did not get overtime each week


## Models
  - x Post -> date:date rationale:text
  - x User -> Devise
  - x AdminUser -> STI

## Features:
  - Approval workflow - when post is created admin may approve it
  - SMS messages - link to approval or overtime input
  - Admin dashboard - administrate
  - Email summary to admin users / managers for approval
  - Need documentation for no overtime

## Libraries:
  - x Devise -> user authentication
  - x Administrate -> manage admin dashboard
  - x Bootstrap -> styling/ formatting
  - Twilio -> sms message sending
  - Dotenv -> protect credentials
  - x Rspec -> testing
  - x Capybara -> integration testing
  - x FactoryGirl -> teseting

## TODOS:
  - Title partial
