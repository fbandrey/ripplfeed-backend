module Services
  module Items
    class Create
      attr_reader :item

      def initialize(params, user)
        @item = ::Items::Voice.new(params)
        @item.user = user
      end

      def call
        @item.save
      end

      def run_processing
        VoiceItemJob.perform_later(@item)
      end

    end
  end
end
