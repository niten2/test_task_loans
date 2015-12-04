class User < ActiveRecord::Base

  devise :database_authenticatable, :lockable, :registerable, :recoverable, :rememberable, :trackable, :authentication_keys => [:login]
  has_many :loans

  scope :admin, -> { where(admin: true) }
  scope :manager, -> { where(admin: false) }
  # validates :name, :surname, :patronymic, :phone, :territory, presence: true


  def autor_of?(object)
    object.user_id == self.id
  end

  def email_changed?
    false
  end


end
