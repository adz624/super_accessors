# SuperAccessors

Supported split datetime attributes, store hash key datatypes (Integer, String, Boolean)


## Installation

Add this line to your application's Gemfile:

    gem 'super_accessors'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install super_accessors

## Usage

### Split Date / Time

```
# app/models/user.rb
class Ticket < ActiveRecord::Base
  split_date_hour_min :depart_datetime, default: lambda { Time.now + 1.day }
  ticket.depart_time_start_date = '2013/10/20'
  ticket.depart_time_start_time = '20:10'
  # '2013/10/20 20:10'
end
```

### Split Date / Hour / Min

```
class Ticket < ActiveRecord::Base
  split_date_time :depart_time_start, default: lambda { Time.now + 1.day }
end

ticket = Ticket.new
ticket.depart_time_start_date = '2013/10/20'
ticket.depart_time_start_hr = '10'
ticket.depart_time_start_min = '20'
# '2013/10/20 10:20'

```

### Store

```
# app/models/user.rb
class User < ActiveRecord::Base
  store_define :contact_info, accessors: {name: :s, zipcode: :i, mobile: :s, available: :b}
end

@user.name = 123
"123"
@user.zipcode = "123"
123
@user.available = 1
true
```

### Checkboxes with Store
```
# app/models/user.rb
class User < ActiveRecord::Base
  store_define :role, accessors: {admin: :b, manager: :b, user: :b}, checkboxes: true
end

# show all true option keys
@user.role_keys
[:admin, :manager]

# show all true option with i18n
@user.role_options
['管理員', '使用者']
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
