module Services
  module Users
    class Create
      attr_reader :user

      def initialize(params)
        @user = User.new(params)
      end

      def call
        User.transaction do
          @user.save!
          @user.roles << Role.person
          true
        end
      rescue
        false
      end

    end
  end
end
