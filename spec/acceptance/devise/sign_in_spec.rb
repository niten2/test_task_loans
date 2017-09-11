require_relative '../acceptance_helper'

feature 'User siging in' do

  given(:user) { create(:user) }

  scenario "existing User Account Login" do
    sign_in(user)
    expect(page).to have_content 'Вход в систему выполнен.'
  end

  scenario 'non-existent user tries to log in to your account' do
    visit new_user_session_path
    fill_in 'Login', with: 'wrong@user.com'
    fill_in 'Password', with: '12345'
    click_on 'Войти'

    expect(page).to have_content 'Неверный login или пароль.'
  end

end
