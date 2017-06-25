class NewsController < ApplicationController

  def index
    @series = Serie.pluck(:name)
    @actors = Actor.pluck(:name)
    search_in = News.all
    @news = News.search(params[:title_search],
                           params[:serie_search],
                           params[:actor_search],
                           search_in)
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