require 'rails_helper'

feature 'View a pokemon description after searching for his name' do
  scenario 'successfully' do
    visit root_path

    fill_in 'Nome do pokemon', with: 'Rattata'

    expect(current_path).to eq(pokemon_path)
    expect(page).to have_content('Nome: Rattata')
    expect(page).to have_content('Tipo: Normal')
    expect(page).to have_content('Base experience: 51')
    expect(page).to have_content('HP: 30')
    expect(page).to have_content('Attack: 56')
    expect(page).to have_content('Defense: 35')
    expect(page).to have_content('Special-attack: 25')
    expect(page).to have_content('Special-defense: 35')
    expect(page).to have_content('Speed: 72')
  end

  scenario 'and show a message saying the pokemon does not exists' do
    visit root_path

    fill_in 'Nome do pokemon', with: 'Guilmon'

    expect(page).to have_content('Pokemon não encontrado, tente novamente.')
  end

  scenario 'and return to home page' do
    visit root_path

    fill_in 'Nome', with: 'Rattata'
    click_on 'Voltar'

    expect(current_path).to eq(root_path)
  end
end
