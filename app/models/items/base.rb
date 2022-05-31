module Items
  class Base < ApplicationRecord
    self.table_name = 'items'

    belongs_to :user

    validates :user, presence: true

    state_machine initial: :pending do
      event :complete do
        transition pending: :completed #, if: :file_present?
      end
    end

    def file_path
      raise NotImplementedError
    end
  end
end
