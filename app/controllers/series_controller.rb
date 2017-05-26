class SeriesController < ApplicationController
  include Secured
  layout "all_layout"
  before_action :set_series, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, only: [:index]

  # GET /series
  # GET /series.json
  def index
    if current_user&.admin?
      @series = Serie.all
    else
      @series = User.find(current_user).series
    end
  end

  def home
    @languages = Serie.languages
    @genres = Genre.all.pluck(:genre)
    # retorna la que no son privadas si es que no se le da ningun parametro
    @series = Serie.search(params[:name_search], params[:language_search],
    params[:genre_search])
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
        format.html { redirect_to '/series/' + @series.id.to_s, notice: 'Serie was successfully updated.' }
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
      serie_params = params.require(:serie).permit(:name, :description, :language, :private, :genres)
			serie_params[:user_id] = current_user.id
			serie_params
    end

    def searches_params
      params.require(:serie).permit(:name, :language, :private, :genres)
    end
end
