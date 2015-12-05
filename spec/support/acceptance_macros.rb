module AcceptanceMacros
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Login', with: user.login
    fill_in 'Password', with: user.password
    click_on 'Войти'
  end
end

