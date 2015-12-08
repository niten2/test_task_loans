class Loan < ActiveRecord::Base

  belongs_to :client
  validates :sum, presence: true

  def count_total_sum
    start_sum = self.sum
    territory = self.client.user.territory.to_i
    count_day = (self.end_loan - self.date_issue )/(60*60*24)

    percent = ((start_sum * territory).to_f)/100

    if count_day <= 30
      less_mount = count_day
      more_mount = 0
    else
      less_mount = 30
      more_mount = count_day - 30
    end

    # if self.client.loans.loans_exist?
    if self.client.loans_exist?
      total_sum = (start_sum * territory) + (15*percent * count_day)
    else
      total_sum = (start_sum * territory) + (percent * less_mount) + (15*percent * more_mount)
    end

    self.total_sum = total_sum
  end


end
