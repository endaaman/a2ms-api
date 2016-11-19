json.array!(@users) do |user|
  json._id  "#{user.id}"
  json.extract! user, :id, :username, :admin, :approved, :created_at, :updated_at
end
