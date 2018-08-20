class Role < ActiveRecord::Base
  has_many :user_roles
  has_many :users, through: :user_roles
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
end