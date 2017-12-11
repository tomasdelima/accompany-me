require 'rails_helper'

feature 'Sign up' do
  scenario 'when the form is valid' do
    expect(User.count).to be 0

    sign_up sample_user

    expect(User.count).to be 1
    expect(page.current_path).to eq root_path
  end

  scenario 'when the form is invalid', js: true do
    visit new_user_session_path

    within '.sign-up' do
      fill_in 'user_email', with: 'user@email.com'
      click_button 'Me cadastre!'
    end

    expect(User.count).to be 0
    expect(page.current_path).not_to eq root_path
  end
end

feature 'Sign in', js: true do
  # before { sign_up sample_user, false }

  scenario 'when the credentials are valid' do
    sign_up sample_user, false

    within '.sign-in' do
      fill_in 'user_email',    with: 'user@email.com'
      fill_in 'user_password', with: '12345678'
      click_button 'Entrar'
    end

    expect(page.current_path).to eq root_path
  end

  scenario 'when the credentials are wrong' do
    sign_up sample_user, false

    within '.sign-in' do
      fill_in 'user_email',    with: 'user@email.com'
      fill_in 'user_password', with: 'wrong'
      click_button 'Entrar'
    end

    expect(page.current_path).not_to eq root_path
  end
end

feature 'Sign out' do
  # before { login_user }

  scenario 'when the credentials are valid', js: true do
    login_user

    click_button 'Logout'

    expect(page.current_path).to eq new_user_session_path
  end
end

private

  def sample_user
    {
      email: 'user@email.com',
      password: '12345678',
      password_confirmation: '12345678',
    }
  end

  def sign_up(user, remain_signed_in=true)
    visit new_user_session_path

    within '.sign-up' do
      fill_in 'user_email',                 with: user[:email]
      fill_in 'user_password',              with: user[:password]
      fill_in 'user_password_confirmation', with: user[:password_confirmation]
      click_button 'Me cadastre!'
    end
debugger
    click_button('Logout') if !remain_signed_in
  end

  # def create_user
  #   User.create(email: 'user@email.com', password: '12345678', password_confirmation: '12345678', signed_up: true)
  # end

  def login_user
    sign_up sample_user

    within '.sign-in' do
      fill_in 'user_email',    with: 'user@email.com'
      fill_in 'user_password', with: '12345678'
      click_button 'Entrar'
    end
  end