require 'rails_helper'

feature 'View a pokemon description after searching for his name' do
  scenario 'successfully' do
    visit root_path
    fill_in 'Nome', with: 'Rattata'
    click_on 'Pesquisar'

    expect(current_path).to eq(pokemons_path)
    expect(page).to have_content(
      "Pokemon: Rattata\nTypes:\nNormal\nBase experience: 51\nHp: 30\nAttack:" \
      " 56\nDefense: 35\nSpecial-attack: 25\nSpecial-defense: 35\nSpeed: 72"
    )
  end

  scenario 'with no success' do
    visit root_path
    fill_in 'Nome', with: 'Guilmon'
    click_on 'Pesquisar'

    expect(current_path).not_to eq(pokemons_path)
  end

  scenario 'and return to home page' do
    visit root_path

    fill_in 'Nome', with: 'Rattata'
    click_on 'Pesquisar'
    click_on 'Voltar'

    expect(current_path).to eq(root_path)
  end
end
