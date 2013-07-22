# !/usr/bin/env ruby
require "rubygems"
require "bundler/setup"
require "mailman"

#Mailman.config.logger = Logger.new("log/mailman.log")  # uncomment this if you can want to #create a log file

Mailman::Application.run do
  default do
    begin
      TaskMailer.receive(message)
    rescue Exception => e
      Mailman.logger.error "Exception occurred while receiving message:n#{message}"
      Mailman.logger.error [e, *e.backtrace].join("n")
    end
  end
end