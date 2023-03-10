# frozen_string_literal: true

require 'rails_helper'

feature 'User access profile' do
  scenario 'successfully and has not sold a pokemon' do
    user = create(:user)

    login_as user, scope: :user
    visit profile_path

    expect(page).to have_content('Meu perfil')
    expect(page).to have_content('Nome: Tester')
    expect(page).to have_content('Carteira:')
    expect(page).to have_content('Bitcoins: 0.00000000 BTC')
    expect(page).to have_content('Dólar: $ 0.0000')
    expect(page).to have_link('Voltar')
  end

  scenario 'successfully and has sold two pokemons' do
    user = create(:user)
    first_pokemon = create(:pokemon, name: 'rattata', user_id: user.id)
    second_pokemon = create(:pokemon, name: 'bulbasaur', user_id: user.id)
    bitcoins = first_pokemon[:experience] + second_pokemon[:experience]

    login_as user, scope: :user
    visit pokemons_path
    click_button 'Vender Rattata'
    click_button 'Vender Bulbasaur'

    click_on 'Voltar'

    expect(current_path).to eq(profile_path)
    expect(page).to have_content(bitcoins)
    expect(page).to have_content(user.usd_wallet)
  end
end
