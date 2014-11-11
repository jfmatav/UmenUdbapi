json.array!(@acompanamientos) do |acompanamiento|
  json.extract! acompanamiento, :id, :acompanamientos, :dia, :semana, :soda_id
  json.url acompanamiento_url(acompanamiento, format: :json)
end
