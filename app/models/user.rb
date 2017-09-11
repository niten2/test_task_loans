class User < ActiveRecord::Base

  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :lockable,
    :authentication_keys => [:login]

  scope :admin, -> { where(admin: true) }
  scope :manager, -> { where(admin: false) }

  validates :name,
    :surname,
    :patronymic,
    :phone,
    :territory,
    presence: true

  has_many :clients

  def email_changed?
    false
  end

end
