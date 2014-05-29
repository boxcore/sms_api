require 'net/http'
module SmsApi
  class Service
    extend ConfigurationHelpers

    def self.send_msg(mobile,content)
      uri     = URI(sms_server)
      params  = {
                  action: "send",
                  userid: sms_user_id,
                  account: sms_account,
                  password: sms_password,
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
                                        response_at:Time.now,
                                        response_status:res.code)
      log.save
      return res.is_a?(Net::HTTPSuccess)
    end
  end
end