require "super_accessors/version"
require 'super_accessors/datetime'
require 'super_accessors/store'

ActiveRecord::Base.extend SuperAccessors::Datetime
ActiveRecord::Base.extend SuperAccessors::Store