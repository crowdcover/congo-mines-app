json.array!(@categories) do |category|
  json.extract! category, :id, :position, :name, :aasm_state
  json.url category_url(category, format: :json)
end
