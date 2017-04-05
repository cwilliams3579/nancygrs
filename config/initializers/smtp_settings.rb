ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:domain => "example.com",
	:user_name => "test@example.com",
	:password => "password",
	:authentication => "plain",
	:enable_starttls_auto => true
}
