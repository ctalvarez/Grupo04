class NewsController < ApplicationController
  before_action :set_news, only: %i[show edit update destroy]

  def index
    @series = Serie.pluck(:name)
    @actors = Actor.pluck(:name)
    search_in = News.all
    @news = News.search(params[:title_search],
                           params[:serie_search],
                           params[:actor_search],
                           search_in)
  end

  def edit
  end

  def show
    @news = News.find(params[:id])
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to '/news/' + @news.id.to_s, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    user_id = @news.user.id
    @news.destroy
    respond_to do |format|
      format.html { redirect_to '/users/' + user_id, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end

private

def set_news
  @news = News.find(params[:id])
end

def news_params
  params.require(:news).permit(:id, :title, :body, :serie_id, :actor_ids=>[])
end