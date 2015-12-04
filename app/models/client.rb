class Client < ActiveRecord::Base

  has_many :loans
  belongs_to :user
  validates :name, :surname, :patronymic, :phone, :passport, presence: true

  def count_end_sum
    100

  end

end
