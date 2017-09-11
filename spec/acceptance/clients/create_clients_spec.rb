require_relative '../acceptance_helper'

feature 'create clients' do

  given!(:user) { create(:user) }

  scenario "user creates answer to your question" do
    sign_in(user)
    visit user_clients_path(user)
    click_on "Новый клиент"
    fill_in "client_name", with: "name"
    fill_in "client_surname", with: "surname"
    fill_in "client_patronymic", with: "patronymic"
    fill_in "client_phone", with: "123"
    fill_in "client_email", with: "123"
    fill_in "client_passport", with: "123"
    click_on "Создать клиента"
  end

end
