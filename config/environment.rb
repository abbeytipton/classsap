# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Configuration for using SendGrid on Heroku
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :user_name => ENV["apikey"],
  :password => ENV["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"],
  :domain => "class-sap.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
