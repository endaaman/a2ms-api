if @category.errors and not @category.errors.empty?
  json.errors @category.errors
else
  json.merge! @category.attributes
  json.set! :_id, "#{@category.id}"
end
