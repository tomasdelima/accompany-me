require 'rails_helper'

feature 'On a real use case', js: false do
  let(:user) { FactoryGirl.build :user }
  let(:friend) { FactoryGirl.build :friend }
  let(:activity) { FactoryGirl.build :activity }
  let(:accompaniment) { FactoryGirl.build :accompaniment }

  it 'works' do
    sign_up
    sign_out
    login

    create_friend
    expect(page.current_path).to eq friend_path(Friend.last)

    create_activity
    expect(page.current_path).to eq activity_path(Activity.last)

    create_record 'accompaniment', 'name'
  end
end

private
  def sign_up
    visit new_user_session_path

    within '.sign-up' do
      fill_in 'user_email',                 with: user.email
      fill_in 'user_password',              with: '12345678'
      fill_in 'user_password_confirmation', with: '12345678'
      click_button 'Me cadastre!'
    end
  end

  def sign_out
    click_link('Logout')
  end

  def login
    within '.sign-in' do
      fill_in 'user_email',    with: user.email
      fill_in 'user_password', with: '12345678'
      click_button 'Entrar'
    end
  end

  def create_friend
    click_link 'Criar Amigo'
    fill_in 'friend_email', with: friend.email
    click_button 'Salvar Amigo'
  end

  def create_activity
    click_link 'Criar Atividade'
    fill_in 'activity_name', with: activity.name
    click_button 'Salvar Atividade'
  end

  def create_record(model, field)
    class_name = I18n.t("activerecord.model.#{model}")

    click_link "Criar #{class_name}"
    fill_in "#{model}_#{field}", with: send(model).send(field)
    click_button "Salvar #{class_name}"
  end
