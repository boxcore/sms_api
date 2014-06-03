# encoding: utf-8
require 'spec_helper'
describe 'test sms request' do

  it "connect mongoid" do
    log = SmsApi::Models::SmsLog.new
    log.request_at =  Time.now
    log.request_body = "aaas"
    log.save

    p SmsApi::Models::SmsLog.all
    p SmsApi::Models::SmsLog.all.length
    #PinganApi::Models::Log.write
    true.should be true
  end

  it "send sms" do
    SmsApi::Service.instance.send_message('18101801755', 'hello')
    p SmsApi::Models::SmsLog.first
    true.should be true
  end
 
end