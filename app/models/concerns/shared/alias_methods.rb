module Shared
  module AliasMethods
    extend ActiveSupport::Concern

    # Default alias column is 'name'.
    ALIAS_ATTR = :name

    # Returns alias name of object based on alias column.
    # Column name may be overwritten by class var 'alias_attr' like:
    #
    # class Foo
    #   @@alias_attr = :bar
    #   include Shared::AliasMethods
    # end
    def alias
      @alias || begin
        column = self.class.class_variable_get(:@@alias_attr) || ALIAS_ATTR
        raise NameError unless self.respond_to? column
        @alias = self.send(column).underscore.parameterize(separator: '_')
      end
    end

    included do
      cattr_accessor :alias_attr, instance_accessor: false

      self.find_each do |_object|
        define_singleton_method _object.alias do
          _object
        end unless method_defined? _object.alias
      end if self.table_exists?
    end

  end
end
