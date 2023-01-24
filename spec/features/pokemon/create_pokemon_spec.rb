require 'rails_helper'

feature 'Create a pokemon by adding his name' do
  scenario 'successfully' do
    visit root_path

    click_on 'Pokemons adquiridos'
    fill_in 'Nome do pokemon', with: 'rattata'
    click_on 'Registrar'

    expect(current_path).to eq(adquired_pokemons_path)
    expect(page).to have_content('Registrar novo pokemon')
    expect(page).to have_content("Pokemon: Rattata # 1\nExperience: 51")
  end

  scenario 'with no success' do
    visit root_path

    click_on 'Pokemons adquiridos'
    fill_in 'Nome do pokemon', with: 'rattata'
    click_on 'Registrar'

    expect(page).to have_content(
      'Pokemon não encontrado, por favor, tente novamente.'
    )

    expect(current_path).to eq(pokemon_not_found_path)
    expect(page).to have_link('Voltar')
  end
end
