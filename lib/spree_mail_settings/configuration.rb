module SpreeGlobalize
  class Configuration < Spree::Preferences::Configuration
    # These configs intend to, respectively:
    #
    #   Say which Globalized inputs are displayed on backend
    #   Set locales that should be available for end users
    #
    # e.g. If available_locales are [:en, :es] admin can translate model records
    # to spanish as well. Once it's done :es can be added to supported_locales
    preference :supported_locales, :array, default: [:en]
     # Default mail headers settings
    preference :mails_from, :string, default: 'spree@example.com'
    preference :enable_mail_delivery, :boolean, default: false
    preference :mail_bcc, :string, default: 'spree@example.com'
    preference :intercept_email, :string, default: nil

    # Default smtp settings
    preference :mail_host, :string, default: 'localhost'
    preference :mail_domain, :string, default: 'localhost'
    preference :mail_port, :integer, default: 25
    preference :secure_connection_type, :string, default: Core::MailSettings::SECURE_CONNECTION_TYPES[0]
    preference :mail_auth_type, :string, default: Core::MailSettings::MAIL_AUTH[0]
    preference :smtp_username, :string, default: nil
    preference :smtp_password, :string, default: nil
  end
end
