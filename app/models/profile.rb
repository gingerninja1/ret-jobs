class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  mount_uploader :avatar, AvatarUploader
  
  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
  end
  
  def self.search(search)
    where("first_name LIKE ? OR last_name LIKE ? OR bio LIKE ? OR skills LIKE ? OR categories.name LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
  end
end
