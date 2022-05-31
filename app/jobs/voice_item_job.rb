class VoiceItemJob < ApplicationJob
  queue_as :default

  def perform(item)
    sleep 10
    service = processing_service.new(item)
    service.call
  end

  private

  def processing_service
    @processing_service ||= Services::Items::Processing
  end
end
