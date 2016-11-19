json.array!(@newss) do |news|
  json._id  "#{news.id}"
  json.merge! news.attributes
end
