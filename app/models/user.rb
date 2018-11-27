class User < ActiveRecord::Base
  has_many :jobs, dependent: :destroy
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_one :profile
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :reviews

  accepts_nested_attributes_for :profile, :categories, :roles
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, 
         :recoverable, :rememberable, :trackable, :validatable
end
