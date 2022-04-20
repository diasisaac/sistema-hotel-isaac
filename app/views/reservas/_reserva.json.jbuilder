json.extract! reserva, :id, :quarto_id, :cliente_id, :check_in, :checkout, :numero_adultos, :numero_criancas, :pedidos, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
