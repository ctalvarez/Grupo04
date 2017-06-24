class NewsController < ApplicationController

  def index
    @news = News.all
  end

  def show
    @news = News.find(params[:id])
  end
end

private

def set_news
  @news = News.find(params[:id])
end

def news_params
  params.require(:news).permit(:id)
end