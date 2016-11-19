json.array!(@articles) do |article|
  json._id  "#{article.id}"
  json.merge! article.attributes
end
