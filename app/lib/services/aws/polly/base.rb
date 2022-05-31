module Services
  module AWS
    module Polly
      class Base

        protected

        def client
          @client ||= Aws::Polly::Client.new(
            region: 'us-west-2',
            access_key_id: ENV['AWS_KEY_ID'],
            secret_access_key: ENV['AWS_KEY_SECRET']
          )
        end

      end
    end
  end
end
