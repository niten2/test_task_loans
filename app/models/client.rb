class Client < ActiveRecord::Base

  has_many :loans
  belongs_to :user
  validates :name, :surname, :patronymic, :phone, :passport, presence: true

end
