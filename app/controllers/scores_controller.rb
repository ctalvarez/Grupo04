class ScoresController < ApplicationController
  layout 'all_layout'
  before_action :set_score, only: %i[show edit update destroy]

  # GET /scores
  # GET /scores.json
  def index
    @scores = Score.all
  end

  # GET /scores/1
  # GET /scores/1.json
  def show; end

  # GET /scores/new
  def new
    @score = Score.new
  end

  # GET /scores/1/edit
  def edit; end

  # POST /scores
  # POST /scores.json
  def create
    @user = current_user

    @score = Score.new(score_params)

    respond_to do |format|
      if @score.save
        serie_id = @score.chapter.serie.id
        season_id = @score.chapter.session.id
        chapter = @score.chapter
        format.html { redirect_to series_session_chapter_path(serie_id, season_id, chapter), notice: 'Score was successfully created.' }
        format.json { render :show, status: :created, location: @score }
      else
        format.html { render :new }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  def update
    respond_to do |format|
      if @score.update(score_params)
        serie_id = @score.chapter.serie.id
        season_id = @score.chapter.session.id
        chapter = @score.chapter
        format.html { redirect_to series_session_chapter_path(serie_id, season_id, chapter), notice: 'Score was successfully updated.' }
        format.json { render :show, status: :ok, location: @score }
      else
        format.html { render :edit }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
    @score.destroy
    respond_to do |format|
      format.html { redirect_to scores_url, notice: 'Score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_score
    @score = Score.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
  def set_chapter
    @chapter = Chapter.find(params[:chapter_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def score_params
    params.require(:score).permit(:comment, :score, :user_id, :chapter_id)
  end
end
