class User < ActiveRecord::Base
  store_define :contact_info, accessors: {name: :s, zipcode: :i, mobile: :s, available: :b}
  store_define :roles, accessors: {admin: :b, manager: :b, teacher: :b, worker: :b}, checkboxes: true

  split_date_time :confirm_datetime, default: lambda { Time.now }
  split_date_hour_min :last_login_datetime, default: lambda { Time.now }
end
