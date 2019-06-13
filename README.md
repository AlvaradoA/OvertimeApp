# Overtime App

## High level requirement: Company needs documentation that salaried employess did or did not get overtime each week

  Post
    date
    rationale

  User
    devise
      ^
      |
    STI - single table inheritance
  AdminUser

## Features:
  Approval workflow - when post is created admin may approve it
  SMS messages - link to log time
  Admin dashboard - administrate gem
  Email summary to admin users for approval
  Need documentation for no overtime

## Libraries:
  Devise - user authentication
  Administrate gem - manage admin dashboard
  Bootstrap - styling
  Twilio - sms message sending
  Dotenv - protect credentials
  Rspec - testing
  Capybara - integration testing
