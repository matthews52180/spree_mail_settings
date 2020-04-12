module SpreeMailSettings
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_mail_settings'

    config.autoload_paths += %W(#{config.root}/lib)

    initializer "spree_mail_settings.environment", before: :load_config_initializers do |app|
      SpreeMailSettings::Config = SpreeMailSettings::Configuration.new
    end

    
    def self.activate
      #Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
      #  Rails.configuration.cache_classes ? require(c) : load(c)
      #end
      #Dir.glob(File.join(File.dirname(__FILE__), '../../../app/**/*_decorator*.rb')) do |c|
      #  Rails.configuration.cache_classes ? require(c) : load(c)
      #end
      Dir.glob(File.join(root, "app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
      
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/spree/*_decorator*.rb')) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
    end

    initializer 'spree_mail_settings' do
      ActionMailer::Base.add_delivery_method :spree, Spree::Core::MailMethod
      Spree::Core::MailSettings.init
      Mail.register_interceptor(Spree::Core::MailInterceptor)
    end

    #config.to_prepare(&method(:activate).to_proc)
    config.to_prepare &method(:activate).to_proc
  end
end
