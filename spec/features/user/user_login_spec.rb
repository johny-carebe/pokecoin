# frozen_string_literal: true

require 'rails_helper'

feature 'User login' do
  scenario 'from home page' do
    User.create!(email: 'login_test@test.com', password: '12345678')

    visit root_path
    click_on 'Login'

    within 'form' do
      fill_in 'Email', with: 'login_test@test.com'
      fill_in 'Senha', with: '12345678'
      click_on 'Login'
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_link('Logout')
    expect(page).not_to have_link('Login')
  end
end
