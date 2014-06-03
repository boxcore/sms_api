# encoding: utf-8
require "sms_api/version"
require "sms_api/configuration"
require "sms_api/models/sms_log"
require "sms_api/service"

module SmsApi
  class << self
    def setup
      yield config
    end

    def config
      @config ||= Configuration.new
    end
  end
end
