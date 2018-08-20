class Job < ActiveRecord::Base
  belongs_to :user
  has_many :job_categories
  has_many :categories, through: :job_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end