if @user.errors and not @user.errors.empty?
  json.errors @user.errors
else
  json.extract! @user, :id, :username, :admin, :approved, :created_at, :updated_at
  json.set! :_id, "#{@user.id}"
end
