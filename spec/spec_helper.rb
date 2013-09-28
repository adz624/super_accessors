require 'rubygems'
require 'bundler/setup'
require 'active_record'
require 'super_accessors'
require 'db/connection'
require 'db/factories'
require 'db/user'

User.create([{}])

RSpec.configure do |config|
  # some (optional) config here
end