class Review < ActiveRecord::Base
  belongs_to :profile
  validates_presence_of :rating, :review
end
