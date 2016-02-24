class User < ActiveRecord::Base
  def assign_default_role
    add_role(:user)
  end
  after_create :assign_default_role
  rolify
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates_integrity_of  :avatar
  validates_processing_of :avatar
end
