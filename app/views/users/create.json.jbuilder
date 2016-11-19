if @user.errors and not @user.errors.empty?
  json.errors @user.errors
end
