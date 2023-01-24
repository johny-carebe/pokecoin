# frozen_string_literal: true

require 'rails_helper'

feature 'User access profile' do
  scenario 'successfully and has not sold a pokemon' do
    user = create(:user)

    login_as user, scope: :user
    visit root_path
    click_on 'Meu Perfil'

    expect(current_path).to eq(profile_index_path)
    expect(page).to have_content('Meu perfil')
    expect(page).to have_content('Nome: Tester')
    expect(page).to have_content('Carteira:')
    expect(page).to have_content('Bitcoins: 0 BTC')
    expect(page).to have_content('Dólar: $ 0.00')
    expect(page).to have_link('Voltar')
  end

  scenario 'successfully and has sold a pokemon' do
    user = create(:user)
    adquired_pokemon = create(:adquired_pokemon, user:)
    create(:pokemon, name: 'rattata', adquired_pokemon_id: adquired_pokemon.id)
    create(:pokemon, name: 'bulbasaur', adquired_pokemon_id: adquired_pokemon.id)

    login_as user, scope: :user
    visit root_path
    click_on 'Meu Perfil'

    expect(current_path).to eq(profile_index_path)
    expect(page).to have_content('Meu perfil')
    expect(page).to have_content('Nome: Tester')
    expect(page).to have_content('Carteira:')
    expect(page).to have_content('Meus Bitcoins: ')
    expect(page).to have_link('Voltar')
  end
end
