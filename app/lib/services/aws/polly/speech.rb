module Services
  module AWS
    module Polly
      class Speech < Base

        def initialize(text, file_path)
          @text = text
          @file_path = file_path
        end

        def call
          response
        rescue Aws::Polly::Errors::ServiceError
          false
        end

        private

        def response
          client.synthesize_speech({
            response_target: @file_path,
            output_format: 'mp3',
            sample_rate: '8000',
            text: @text,
            text_type: 'text',
            voice_id: 'Joanna',
          }).to_h
        end

      end
    end
  end
end
