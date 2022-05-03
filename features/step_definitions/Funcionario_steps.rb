
Given('a conta com email {string} e senha {string} existe') do |email, senha|
  visit '/usuarios/sign_up'
  expect(page).to have_current_path('/usuarios/sign_up')

  fill_in 'usuario[email]', :with => email
  fill_in 'usuario[password]', :with => senha
  fill_in 'usuario[password_confirmation]', :with => senha
  click_button 'Sign up'
end

Given('eu estou logado no sistema') do
  expect(page).to have_content("Welcome! You have signed up successfully.")
end


Given('eu estou na pagina de criar novo quarto') do

  visit "/quartos/new"
  expect(page).to have_current_path('/quartos/new')

end


When('eu crio um quarto de nome {string} e andar {string} e diaria {string} e capacidade {string} e descricao {string}') do |nome, andar, diaria, capacidade, descricao|


  fill_in 'quarto[nome]', :with => nome
  fill_in 'quarto[andar]', :with => andar
  fill_in 'quarto[diaria]', :with => diaria
  fill_in 'quarto[capacidade]', :with => capacidade
  fill_in 'quarto[descricao]', :with => descricao
  click_button 'Create Quarto'

end

Then('eu vejo que o quarto de nome {string} foi salvo') do |nome|

  expect(page).to have_content(nome)
  expect(page).to have_current_path("/quartos/" +  Quarto.last.id.to_s )
end

Given('eu estou na pagina de quartos') do
  visit "/quartos/"

end

Given('o quarto de nome {string} e andar {string} e diaria {string} e capacidade {string} e descricao {string} existe') do |nome, andar, diaria, capacidade, descricao|


  visit "/quartos/new"
  fill_in 'quarto[nome]', :with => nome
  fill_in 'quarto[andar]', :with => andar
  fill_in 'quarto[diaria]', :with => diaria
  fill_in 'quarto[capacidade]', :with => capacidade
  fill_in 'quarto[descricao]', :with => descricao
  click_button 'Create Quarto'

end

When('eu vou para página de editar quarto e edito o quarto de nome {string} e andar {string} e diaria {string} e capacidade {string} e descricao {string}') do |nome, andar, diaria, capacidade, descricao|

  click_link 'Edit this quarto'

  fill_in 'quarto[nome]', :with => nome
  fill_in 'quarto[andar]', :with => andar
  fill_in 'quarto[diaria]', :with => diaria
  fill_in 'quarto[capacidade]', :with => capacidade
  fill_in 'quarto[descricao]', :with => descricao
  click_button 'Update Quarto'
end

Then('eu vejo que o quarto de nome {string} foi editado') do |nome|

  expect(page).to have_content(nome)
  expect(page).to have_current_path("/quartos/" +  Quarto.last.id.to_s )
end


Then('eu vejo uma mensagem de erro') do

  expect(page).to have_content("1 error prohibited this quarto from being saved:")
end
