json.array!(@images) do |image|
  json.extract! image, :id, :filename, :command
  json.url image_url(image, format: :json)
end
