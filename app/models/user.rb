class User < ActiveRecord::Base
  has_many :jobs, dependent: :destroy
  has_many :user_roles
  has_many :roles, through: :user_roles
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, 
         :recoverable, :rememberable, :trackable, :validatable
end
