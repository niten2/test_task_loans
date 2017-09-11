require 'rails_helper'

describe User do

  it { should have_many :clients }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:surname) }
  it { should validate_presence_of(:patronymic) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:territory) }

end
