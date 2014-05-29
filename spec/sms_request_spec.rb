require 'spec_helper'
describe 'test sms request' do


  it " connect mongoid" do
    log = SmsApi::Models::SmsLog.new
    log.request_at =  Time.now
    log.request_body = "aaas"
    log.save

    p SmsApi::Models::SmsLog.all
    p SmsApi::Models::SmsLog.all.length
    #PinganApi::Models::Log.write
    true.should be_true
  end

  it "send sms" do
    SmsApi::Service.send_msg('18616015606','hello')
    p SmsApi::Models::SmsLog.first
    true.should be_true
  end
 
end