class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :books

  def self.json_fields
    %i[
      id
      email
      created_at
    ]
  end
end
