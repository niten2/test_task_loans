class Client < ActiveRecord::Base

  has_many :loans
  belongs_to :user
  validates :name, :surname, :patronymic, :phone, :passport, presence: true

  def mark_removal
    ActiveRecord::Base.transaction do
      self.mark_removal = true
    end
  end
end
