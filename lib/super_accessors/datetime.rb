module SuperAccessors
  module Datetime
    def split_date_time(*attrs)
      opts = { format: "%F", default: lambda { Time.now.change(min: 0) } }
      if attrs.last.class == Hash
        custom = attrs.delete_at(-1)
        opts = opts.merge(custom)
      end

      attrs.each do |attr|
        define_method(attr) do
          super() || opts[:default].call
        end

        define_method("#{attr}_date=") do |date|
          return unless date.present?
          date = Date.parse(date.to_s)
          self.send("#{attr}=", self.send(attr).change(year: date.year, month: date.month, day: date.day))
        end

        define_method("#{attr}_time=") do |time|
          return unless time.present
          time = Date.parse(time.to_s)
          self.send("#{attr}=", self.send(attr).change(hour: time.hour, min: time.min))
        end

        define_method("#{attr}_date") do
          self.send(attr).strftime(opts[:format])
        end

        define_method("#{attr}_time") do
          [self.send(attr).hour, self.send(attr).min].join(':')
        end
      end
    end

    def split_date_hour_min(*attrs)
      opts = { format: "%F", default: lambda { Time.now.change(min: 0) } }
      if attrs.last.class == Hash
        custom = attrs.delete_at(-1)
        opts = opts.merge(custom)
      end

      attrs.each do |attr|
        define_method(attr) do
          super() || opts[:default].call
        end

        define_method("#{attr}_date=") do |date|
          return unless date.present?
          date = Date.parse(date.to_s)
          self.send("#{attr}=", self.send(attr).change(year: date.year, month: date.month, day: date.day))
        end

        define_method("#{attr}_hr=") do |hour|
          return unless hour.present?
          self.send("#{attr}=", self.send(attr).change(hour: hour, min: self.send(attr).min))
        end

        define_method("#{attr}_min=") do |min|
          return unless min.present?
          self.send("#{attr}=", self.send(attr).change(min: min))
        end

        define_method("#{attr}_date") do
          self.send(attr).strftime(opts[:format])
        end

        define_method("#{attr}_hr") do
          self.send(attr).hour
        end

        define_method("#{attr}_min") do
          self.send(attr).min
        end
      end
    end
  end
end