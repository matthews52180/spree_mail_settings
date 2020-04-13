require 'spree/core'
Spree::AppConfiguration.class_eval do
    preference :mails_from, :string, default: 'spree@example.com'
    preference :enable_mail_delivery, :boolean, default: false
    preference :mail_bcc, :string, default: 'spree@example.com'
    preference :intercept_email, :string, default: nil

    # Default smtp settings
    preference :mail_host, :string, default: 'localhost'
    preference :mail_domain, :string, default: 'localhost'
    preference :mail_port, :integer, default: 25
    preference :secure_connection_type, :string#, default: Core::MailSettings::SECURE_CONNECTION_TYPES[0]
    preference :mail_auth_type, :string#, default: Core::MailSettings::MAIL_AUTH[0]
    preference :smtp_username, :string, default: nil
    preference :smtp_password, :string, default: nil
end
