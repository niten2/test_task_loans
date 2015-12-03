class Client < ActiveRecord::Base

  validates :name, :surname, :patronymic, :phone, :passport, presence: true

end
