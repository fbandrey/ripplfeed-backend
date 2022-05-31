module Services
  module AWS
    module Polly
      class Voices < Base

        def call
          response[:voices]
        rescue Aws::Polly::Errors::ServiceError
          false
        end

        private

        def response
          client.describe_voices({
            language_code: 'en-US',
          }).to_h
        end

      end
    end
  end
end
