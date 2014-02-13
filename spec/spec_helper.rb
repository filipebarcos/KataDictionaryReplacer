ENV["env"] ||= "test"
$:.unshift File.expand_path("../lib", __FILE__)

require 'dictionary_replacer'

RSpec.configure do |config|
  config.order = "random"
end
