
Given('eu estou na pagina de criar reserva') do
  visit "/reservas/new"
  expect(page).to have_current_path('/reservas/new')
end

When('eu preencho a reserva como check_in {string}, checkout {string}, cliente_id {string}, quarto_id {string}, numero_adultos {string}, numero_criancas: {string}, pedidos {string}') do |check_in, checkout, cliente_id, quarto_id, numero_adultos, numero_criancas, pedidos|
  visit "/reservas/new"

  select cliente_id, :from => 'reserva[cliente_id]'
  select quarto_id, :from => 'reserva[quarto_id]'

  fill_in 'reserva[check_in]', with: check_in
  fill_in 'reserva[checkout]', :with => checkout
  #fill_in 'reserva[cliente_id]', :with => cliente_id
  #fill_in 'reserva[quarto_id]', :with => quarto_id
  fill_in 'reserva[numero_adultos]', :with => numero_adultos
  fill_in 'reserva[numero_criancas]', :with => numero_criancas
  fill_in 'reserva[pedidos]', :with => pedidos
end

When('eu clico em criar reserva') do
  click_button 'Create Reserva'
end

Then('eu vejo uma mensagem que a reserva com o quarto {string} foi criada') do |quarto|
  expect(page).to have_content(quarto)
  expect(page).to have_current_path("/reservas/" +  Reserva.last.id.to_s )
end




Given('a reserva com check_in {string}, checkout {string}, cliente_id {string}, quarto_id {string}, numero_adultos {string}, numero_criancas: {string}, pedidos {string} existe') do |check_in, checkout, cliente_id, quarto_id, numero_adultos, numero_criancas, pedidos|
  visit "/reservas/new"

  select cliente_id, :from => 'reserva[cliente_id]'
  select quarto_id, :from => 'reserva[quarto_id]'

  fill_in 'reserva[check_in]', with: check_in
  fill_in 'reserva[checkout]', :with => checkout
  #fill_in 'reserva[cliente_id]', :with => cliente_id
  #fill_in 'reserva[quarto_id]', :with => quarto_id
  fill_in 'reserva[numero_adultos]', :with => numero_adultos
  fill_in 'reserva[numero_criancas]', :with => numero_criancas
  fill_in 'reserva[pedidos]', :with => pedidos

  click_button 'Create Reserva'
  end


# editar reserva

Given('eu estou na pagina de reservas') do
  visit '/reservas/'
  expect(page).to have_current_path('/reservas')
end



Given('eu estou na pagina da reserva com cliente_id {string} e quarto_id {string}') do |string, string2|

  expect(page).to have_content(string)
  expect(page).to have_content(string2)
  expect(page).to have_current_path("/reservas/" +  Reserva.last.id.to_s )

end

When('eu edito com check_in {string}, checkout {string}, cliente_id {string}, quarto_id {string}, numero_adultos {string}, numero_criancas: {string}, pedidos {string}') do |check_in, checkout, cliente_id, quarto_id, numero_adultos, numero_criancas, pedidos|
  click_link 'Edit this reserva'
  
  select cliente_id, :from => 'reserva[cliente_id]'
  select quarto_id, :from => 'reserva[quarto_id]'

  fill_in 'reserva[check_in]', with: check_in
  fill_in 'reserva[checkout]', :with => checkout
  fill_in 'reserva[numero_adultos]', :with => numero_adultos
  fill_in 'reserva[numero_criancas]', :with => numero_criancas
  fill_in 'reserva[pedidos]', :with => pedidos



end

When('eu clico em editar reserva') do
  click_button 'Update Reserva'
end

Then('eu vejo uma mensagem que a reserva com o quarto {string} foi editada') do |quarto|
  expect(page).to have_content(quarto)
  expect(page).to have_current_path("/reservas/" +  Reserva.last.id.to_s )
end


Then('eu vejo uma mensagem de erro na reserva') do
  expect(page).to have_content("2 errors prohibited this reserva from being saved:")
end

When('eu clico em apagar reserva') do
  click_button 'Destroy this reserva'
end

Then('eu vejo que a reserva foi deletada') do
  expect(page).to have_content("Reserva was successfully destroyed")
end


# listar reservas

When('eu clico no link para ver as reservas') do
  click_link 'Back to reservas'
end

Then('eu vejo as reservas listadas')do
  expect(page).to have_current_path('/reservas')
end

