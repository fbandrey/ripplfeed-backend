class Role < ApplicationRecord
  include Shared::AliasMethods

  has_and_belongs_to_many :users, -> { distinct }

  validates :name, presence: true

end
