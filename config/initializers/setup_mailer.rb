delivery_method = ActionMailer::Base.delivery_method = Yamadb::Mailer.delivery_method
if delivery_method == :smtp
  ActionMailer::Base.smtp_settings = Yamadb::Mailer.smtp_settings || {}
else
  ActionMailer::Base.sendmail_settings = Yamadb::Mailer.sendmail_settings || {}
end
ActionMailer::Base.default_url_options.merge!(Yamadb::Mailer.default_url_options)
