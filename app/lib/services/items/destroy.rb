module Services
  module Items
    class Destroy
      attr_reader :item

      def initialize(item)
        @item = item
      end

      def call
        ::Items::Base.transaction do
          file_path = @item.file_path
          @item.destroy!
          File.delete Rails.root.join('public', file_path)
        end
        true
      rescue
        false
      end

    end
  end
end
