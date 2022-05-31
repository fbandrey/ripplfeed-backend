module Users
  class SessionSerializer < ActiveModel::Serializer

    attributes :full_name, :nick_name, :token

    def token
      object.jwt
    end

    def full_name
      [object.first_name, object.last_name].compact.join(' ')
    end

  end
end
