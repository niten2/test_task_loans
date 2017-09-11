class Client < ActiveRecord::Base

  has_many :loans

  belongs_to :user

  validates :name,
    :surname,
    :patronymic,
    :phone,
    :passport,
    presence: true

  def mark_removal
    ActiveRecord::Base.transaction do
      self.mark_removal = true
    end
  end

  def all_loans_cash
    all_loans_cash = 0
    self.loans.each do |loan|
      all_loans_cash += loan.total_sum.to_i
    end
    return all_loans_cash
  end

  def loans_exist?
    exist = false
    self.loans.each { |loan| exist = true if loan.end_loan.future? }
    return exist
  end

end
