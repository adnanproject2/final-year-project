class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@taskreminder.com"
  layout "mailer"
end
