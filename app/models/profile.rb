class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  mount_uploader :avatar, AvatarUploader
  
  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
  end
end
