class User < ActiveRecord::Base
  # include UserVotable
  # include Omniauthable

  # devise :database_authenticatable, authentication_keys: :login

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :authentication_keys => [:login]

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
