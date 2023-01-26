# frozen_string_literal: true

require 'rails_helper'

feature 'User see list of last transactions' do
  scenario 'successfully' do
    user = create(:user)
    20.times { create(:transaction, user:) }

    login_as user, scope: :user
    visit profile_path
    click_on 'Minhas transações'

    expect(current_path).to eq(transactions_path)
    expect(page).to have_content('Venda do pokemon Rattata # 1')
    expect(page).to have_content('Venda do pokemon Rattata # 20')
    expect(page).to have_link('Voltar')
  end
end
