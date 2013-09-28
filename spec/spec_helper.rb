require 'rubygems'
require 'bundler/setup'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "#{Dir.pwd}/database.sqlite"
)

#require 'SuperAccessor' # and any other gems you need
#require 'SuperAccessor/datetime'
require 'super_accessors'

RSpec.configure do |config|
  # some (optional) config here
end