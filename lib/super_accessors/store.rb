module SuperAccessors
  module Store
    def self.extended(base)
      base.class_eval do
        include Converter
      end
    end
    module Converter
      # for integer converter
      def any_to_i(any)
        any.to_i
      end
      # for string converter
      def any_to_s(any)
        any.to_s
      end
      # for boolean convert
      def any_to_b(any)
        str = any.to_s
        return false if str.blank? || str =~ (/(false|f|no|n|0)$/i)
        return true
      end
    end

    private
    # This function will instead of store function, now support string, boolean, integer
    #
    # Example 1:
    # store_define :contact_info, {name: :s, tel: :s, mobile: :s, available: :b}
    #
    # Example 2 (checkboxes)
    # store_define :role, accessors: {admin: :b, manager: :b, user: :b}, checkboxes: true
    #
    # you have to setup boolean type of all attribute if you are using checkboxes
    # it provide the function
    #   1. show all option of true item
    #   2. show all option of true item with i18n translation
    def store_define(store_name, option)
      column_with_datatype = option[:accessors]
      option[:accessors] = option[:accessors].keys
      # setting the activerecord store
      store store_name, option
      # define the virtual attrs
      column_with_datatype.each do |attr, type|
        self.send("store_key_type_#{type.to_s}", store_name, attr)
      end
      # setting the checkboxs
      if option[:checkboxes]
        store_checkboxes_setup store_name, option[:accessors]
      end
    end

    # get the checkboxes true item list & i18n translation
    def store_checkboxes_setup(store_name, attrs)
      define_method("#{store_name}_keys") do
        list = [];
        attrs.each do |attr|
          if self.send(attr) == true
            list.push(attr)
          end
        end
        list
      end
      define_method("#{store_name}_options") do
        @i18n_base_scope = [:activerecord, :options, self.class.name.underscore, store_name]
        list = [];
        attrs.each do |attr|
          if self.send(attr) == true
            list.push(I18n.t("#{attr}", scope: @i18n_base_scope, :default => attr.to_s.humanize))
          end
        end
        list
      end
    end

    ['i', 's', 'b'].each do |datatype|
      define_method("store_key_type_#{datatype}") do |store_name, attr|
        define_method(attr) do
          value = read_store_attribute(store_name, attr)
          self.send("any_to_#{datatype}", value)
        end
        define_method("#{attr}=") do |value|
          value = self.send("any_to_#{datatype}", value)
          write_store_attribute(store_name, attr, value)
        end
      end
    end
  end
end