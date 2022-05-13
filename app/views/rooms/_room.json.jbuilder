json.extract! room, :id, :name, :capacity, :price, :detail, :created_at, :updated_at
json.url room_url(room, format: :json)
