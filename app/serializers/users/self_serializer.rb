module Users
  class SelfSerializer < ActiveModel::Serializer

    attributes :first_name, :last_name, :nick_name, :email

  end
end
