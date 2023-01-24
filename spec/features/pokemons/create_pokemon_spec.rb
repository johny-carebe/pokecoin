# frozen_string_literal: true

require 'rails_helper'

feature 'Create a pokemon by adding his name' do
  scenario 'successfully' do
    user = create(:user)

    login_as user, scope: :user
    visit root_path
    click_on 'Meu Perfil'
    click_on 'Pokemons adquiridos'
    fill_in 'Nome do pokemon:', with: 'rattata'
    click_on 'Registrar'

    expect(current_path).to eq(adquired_pokemons_path)
    expect(page).to have_content('Registrar novo pokemon')
    expect(page).to have_content('Nome: Rattata #')
    expect(page).to have_content('Experience: ')
  end

  scenario 'with no success' do
    user = create(:user)

    login_as user, scope: :user
    visit root_path
    click_on 'Meu Perfil'
    click_on 'Pokemons adquiridos'
    fill_in 'Nome do pokemon:', with: 'Guilmon'
    click_on 'Registrar'

    expect(page).to have_content(
      'Pokemon não encontrado, por favor, tente novamente.'
    )

    expect(current_path).to eq(pokemon_not_found_path)
    expect(page).to have_link('Voltar')
  end
end
