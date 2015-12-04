class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :authentication_keys => [:login]

  scope :admin, -> { where(admin: true) }
  # scope :red, -> { where(color: 'red') }
  scope :manager, -> { where(admin: false) }
  validates :name, :surname, :patronymic, :phone, :territory, presence: true

  # has_many :questions
  # has_many :answers
  # has_many :authorizations
  # has_many :comments, dependent: :destroy
  # has_many :attachments, dependent: :destroy

  def autor_of?(object)
    object.user_id == self.id
  end

  def email_changed?
    false
  end


end
