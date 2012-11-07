class Sendmail < ActionMailer::Base
	default from: "youth.noreply@gmail.com"
	def snow(recipient, title, subject, message, sent_at = Time.now)
		mail(:to => recipient, :subject => subject, :body => message)
	end
end