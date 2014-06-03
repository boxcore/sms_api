# encoding: utf-8
require 'net/http'
require 'singleton'

module SmsApi
  class Service
    include Singleton

    def send_message(mobile, content)
      uri     = URI(SmsApi.config.server)
      params  = {
                  action: "send",
                  userid: SmsApi.config.username,
                  account: SmsApi.config.account,
                  password: SmsApi.config.password,
                  mobile: mobile,
                  content: content,
                  sendTime: nil,
                  extno: nil
                }
      request_at = Time.now
      uri.query = URI.encode_www_form(params)
      res       = Net::HTTP.get_response(uri)
      
      log = SmsApi::Models::SmsLog.new( request_at: request_at,
                                        request_body: params.to_json,
                                        response_body: res.body ,
                                        response_at: Time.now,
                                        response_status:res.code)
      log.save
      return res.is_a?(Net::HTTPSuccess)
    end
  end
end