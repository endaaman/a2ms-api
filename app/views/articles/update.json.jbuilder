if @article.errors and not @article.errors.empty?
  json.errors @article.errors
else
  json.merge! @article.attributes
  json.set! :_id, "#{@article.id}"
end
