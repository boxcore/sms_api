# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sms_api/version'

Gem::Specification.new do |spec|
  spec.name          = "sms_api"
  spec.version       = SmsApi::VERSION
  spec.authors       = ["liuzelei"]
  spec.email         = ["liuzelei@gmail.com"]
  spec.description   = %q{短信接口}
  spec.summary       = %q{短信接口业务}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.6"
  spec.add_development_dependency "guard", "~> 2.6"
  spec.add_development_dependency "guard-rspec"

  spec.add_runtime_dependency "bson"
  spec.add_runtime_dependency "mongoid"
end
