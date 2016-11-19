if @news.errors and not @news.errors.empty?
  json.errors @news.errors
else
  json.merge! @news.attributes
  json.set! :_id, "#{@news.id}"
end
