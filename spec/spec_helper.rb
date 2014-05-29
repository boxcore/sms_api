$LOAD_PATH.unshift(File.dirname(__FILE__))


ENV["RAILS_ENV"] ||= 'test'

require 'sms_api'
require "mongoid"

# These environment variables can be set if wanting to test against a database
# that is not on the local machine.
ENV["MONGOID_SPEC_HOST"] ||= "localhost"
ENV["MONGOID_SPEC_PORT"] ||= "27017"

# These are used when creating any connection in the test suite.
HOST = ENV["MONGOID_SPEC_HOST"]
PORT = ENV["MONGOID_SPEC_PORT"].to_i

# When testing locally we use the database named mongoid_test. However when
# tests are running in parallel on Travis we need to use different database
# names for each process running since we do not have transactions and want a
# clean slate before each spec run.
def database_id
  "mongoid_test"
end

def database_id_alt
  "mongoid_test_alt"
end

CONFIG = {
  sessions: {
    default: {
      database: database_id,
      hosts: [ "#{HOST}:#{PORT}" ]
    }
  }
}

SERVER   = "http://114.80.116.161:6666/sms.aspx"
USERID   = "118"
ACCOUNT  = "GG-hy"
PASSWORD = "1234567890"
  
SmsApi.configure do |config|
  config.server = SERVER
  config.user_id = USERID
  config.account  = ACCOUNT
  config.password = PASSWORD
end


# Can we connect to MongoHQ from this box?
# def mongohq_connectable?
#   ENV["MONGOHQ_REPL_PASS"].present?
# end

# def purge_database_alt!
#   session = Mongoid::Sessions.default
#   session.use(database_id_alt)
#   session.collections.each do |collection|
#     collection.drop
#   end
# end



# Set the database that the spec suite connects to.
Mongoid.configure do |config|
  config.load_configuration(CONFIG)
end

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.before(:each) do
    Mongoid.purge!
  end
end
