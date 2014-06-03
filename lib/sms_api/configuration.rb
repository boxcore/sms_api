# encoding: utf-8
module SmsApi
  class Configuration
    def server
      @server ||= "http://test_server.com"
    end

    def server=(server)
      @server = server
    end

    def username
      @username ||= "test_user"
    end

    def username=(username)
      @username = username
    end

    def account
      @account ||= "test_account"
    end

    def account=(account)
      @account = account
    end

    def password
      @password ||= "test_password"
    end

    def password=(password)
      @password = password
    end
  end
end
