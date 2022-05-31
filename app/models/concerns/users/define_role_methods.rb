module Users
  module DefineRoleMethods
    extend ActiveSupport::Concern

    Role.find_each do |_role|
      _name = "#{_role.name.parameterize(separator: '_')}?".to_sym
      define_method _name do
        role_ids.include?(_role.id)
      end unless method_defined? _name
    end if Role.table_exists?

  end
end
