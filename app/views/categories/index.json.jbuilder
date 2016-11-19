json.array!(@categories) do |category|
  json._id  "#{category.id}"
  json.merge! category.attributes
end
