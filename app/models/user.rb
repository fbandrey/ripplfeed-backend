class User < ApplicationRecord
  include Users::DefineRoleMethods
  has_secure_password

  has_many :items, class_name: 'Items::Base'
  has_and_belongs_to_many :roles, -> { distinct }

  validates :email, :nick_name, presence: true
  validates :email, uniqueness: true

  def jwt
    @jwt ||= Services::JWT.encode({
      id: id,
      email: email,
      index: rand(100_000_000)
    })
  end

end
