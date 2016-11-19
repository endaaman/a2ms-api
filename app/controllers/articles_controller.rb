class ArticlesController < ApplicationController
  before_action :needs_authorized, only: [:create, :destroy]

  def article_params
    params.require(:article).permit(
      :slug,
      :order,
      :draft,
      :title_en,
      :title_ja,
      :image_url,
      :content_en,
      :content_ja,
      :comment,
      :category_id,
    )
  end

  def index
    if @active
      query = {}
    else
      query = {draft: false}
    end

    @articles = Article.where query
  end

  def create
    @article = Article.new article_params
    @article.category_id = params[:category_id]
    success = @article.save
    render status: success ? 201 : 422
  end

  def update
    @article = Article.find_by id: params[:id]
    @article.update article_params
  end

  def destroy
    Article.destroy params[:id]
    head 204
  end

end
