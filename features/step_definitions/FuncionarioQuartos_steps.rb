Given('eu estou na pagina de criar novo quarto') do
  visit '/rooms/new'
  expect(page).to have_current_path('/rooms/new')
end

When('eu crio um quarto de nome {string}, o preco {string}, a capacidade {string} e a descricao {string}') do |string, string2, string3, string4|
  fill_in 'Ex.: Standard Room', with: string
  #  select string2, :from => "Capacity"
  fill_in 'Ex.: 100.00', with: string3
  fill_in 'Ex.: 1 cama de casal...', with: string4
  click_button 'Cadastrar'
end

Then('eu vejo que o quarto foi salvo') do
  expect(page).to have_content("Room was successfully created.")
end

Given('eu estou na pagina de quartos disponiveis') do
  visit '/rooms'
  expect(page).to have_current_path('/rooms')
end


Given('o quarto de nome {string}, o preco {string}, a capacidade {string} e a descricao {string} existe') do |string, string2, string3, string4|
  visit '/rooms/new'
  fill_in 'Ex.: Standard Room', with: string
  #  select string2, :from => "Capacity"
  fill_in 'Ex.: 100.00', with: string3
  fill_in 'Ex.: 1 cama de casal...', with: string4
  click_button 'Cadastrar'
end

When('eu clico em editar quarto com o nome {string}') do |string|
  click_on "e-#{string}"
end

When('edito o quarto de nome {string}, o preco {string}, a capacidade {string} e a descricao {string}') do |string, string2, string3, string4|
  fill_in 'Ex.: Standard Room', with: string
  #  select string2, :from => "Capacity"
  fill_in 'Ex.: 100.00', with: string3
  fill_in 'Ex.: 1 cama de casal...', with: string4
  click_button 'Cadastrar'
end

Then('eu vejo que o quarto foi editado') do
  expect(page).to have_content("Room was successfully updated.")

end

Then('eu vejo uma mensagem de nome invalido') do
  expect(page).to have_content("Name can't be blank")
end

Then('eu vejo uma mensagem de preco invalido') do
  expect(page).to have_content("Detail can't be blank")
end

When('eu apago o quarto com o nome {string}') do |string|
  click_on "d-#{string}"
  pending
end

Then('eu vejo uma mensagem de deletado com sucesso') do
  pending # Write code here that turns the phrase above into concrete actions
end

