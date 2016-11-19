class NewssController < ApplicationController
  before_action :needs_authorized, only: [:create, :destroy, :update]

  def news_params
    params.require(:newss).permit(
      :message_en,
      :message_ja,
      :url,
      :date,
    )
  end

  def index
    @newss = News.all
  end

  def create
    @news = News.new news_params
    success = @news.save
    render status: success ? 201 : 422
  end

  def update
    @news = News.find_by id: params[:id]
    @news.update news_params
  end

  def destroy
    News.destroy params[:id]
    head 204
  end

end
