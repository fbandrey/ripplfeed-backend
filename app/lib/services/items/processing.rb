module Services
  module Items
    class Processing
      attr_reader :item

      def initialize(item)
        @item = item
      end

      def call
        service = voice_service.new(@item.text, file_path)
        return false unless service.call
        update_item
      end

      private

      def voice_service
        @voice_service ||= Services::AWS::Polly::Speech
      end

      def update_item
        @item.complete
      end

      def file_path
        Rails.root.join('public', 'uploads', 'items', 'voice', [@item.id, 'mp3'].join('.'))
      end

    end
  end
end
