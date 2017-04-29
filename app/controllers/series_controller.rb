class SeriesController < ApplicationController
  layout "all_layout"
  before_action :set_series, only: [:show, :edit, :update, :destroy]

  # GET /series
  # GET /series.json
  def index
    if current_user.rol.eql? 'admin'
      @series = Serie.all
    else
      @series = User.find(current_user).series
    end
  end

  def home
    @series = Serie.where(private: false)
    @idioms = Serie.uniq.pluck(:idiom)
    @genres = Genre.uniq.pluck(:genre)
    if params[:name].present? or params[:idiom].present? or params[:genre].present?

      @series = @series.by_name(params[:name]) if params[:name].present?
      @series = @series.by_idiom(params[:idiom]) if params[:idiom].present?
      @series = @series.Genre.merge(GenreSerie.by_genre) if params[:genre].present?
    end

  end

  # GET /series/1
  # GET /series/1.json
  def show
  end

  # GET /series/new
  def new
    @series = Serie.new
  end

  # GET /series/1/edit
  def edit
  end

  # POST /series
  # POST /series.json
  def create
		@series = Serie.new(series_params)
    respond_to do |format|
      if @series.save

				if !params[:serie][:genre_ids].blank?
					params[:serie][:genre_ids].each do |genre|
						if genre != ""
							GenreSerie.create serie_id: @series.id, genre_id: genre
						end
					end
				end

        format.html { redirect_to @series, notice: 'Serie was successfully created.' }
        format.json { render :show, status: :created, location: @series }
      else
        format.html { render :new }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /series/1
  # PATCH/PUT /series/1.json
  def update
    respond_to do |format|
      if @series.update(series_params)
        format.html { redirect_to @series, notice: 'Serie was successfully updated.' }
        format.json { render :show, status: :ok, location: @series }
      else
        format.html { render :edit }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /series/1
  # DELETE /series/1.json
  def destroy
    @series.destroy
    respond_to do |format|
      format.html { redirect_to series_url, notice: 'Serie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Serie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_params
      serie_params = params.require(:serie).permit(:name, :description, :idiom, :private)
			serie_params[:user_id] = current_user.id
			serie_params
    end
end
