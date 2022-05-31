module Services
  class JWT
    class << self

      ALGORITHM = 'HS512'
      SECRET = ENV['JWT_SECRET']

      def encode(payload, expiration = 1.day.from_now)
        data = payload.merge(exp: expiration.to_i)
        ::JWT.encode(data, SECRET, ALGORITHM)
      end

      def decode(token)
        ::JWT.decode(token, SECRET, true, { algorithm: ALGORITHM })[0]
      rescue
        nil
      end

    end
  end
end
