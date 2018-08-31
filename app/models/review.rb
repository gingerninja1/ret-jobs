class Review < ActiveRecord::Base
  belongs_to :profile
  belongs_to :user
  validates_presence_of :rating, :review
end
