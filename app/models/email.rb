class Email < ActiveRecord::Base
	attr_accessible :bcc, :cc, :send_to, :subject, :title
	after_save :after_safe

	# def snow(recipient, title, subject, message, sent_at = Time.now)
	def after_safe
		@mail = Sendmail.snow(self.send_to,self.subject,self.title,self.subject)
		@mail.deliver
	end
end
