module SmsApi

  class << self

    attr_accessor :configuration

    def config
      self.configuration ||= Configuration.new
    end

    def configure
      yield config if block_given?
    end

  end

  class Configuration
    attr_accessor :server,:user_id,:account, :password
  end

  module ConfigurationHelpers
   
    def sms_server
      @sms_server ||= SmsApi.config.server
    end

    def sms_user_id
      @sms_user_id ||= SmsApi.config.user_id
    end

    def sms_account
      @sms_account ||= SmsApi.config.account
    end

    def sms_password
      @sms_password ||= SmsApi.config.password
    end

  end
end
