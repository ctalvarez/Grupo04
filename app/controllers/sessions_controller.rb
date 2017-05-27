class SessionsController < ApplicationController
  layout 'all_layout'
  before_action :set_session, only: %i[show edit update destroy]

  # GET /chapters
  # GET /chapters.json
  def index
    @sessions = Session.all
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show; end

  # GET /chapters/new
  def new
    @serie = Serie.find(params[:series_id])
    @session = @serie.sessions.build
  end

  # GET /chapters/1/edit
  def edit; end

  # POST /chapters
  # POST /chapters.json
  def create
    @serie = Serie.find(params[:series_id])
    @session = @serie.sessions.build(session_params)

    respond_to do |format|
      if @session.save
        format.html { redirect_to series_session_path(@serie, @session), notice: 'Session was successfully created.' }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to '/series/' + @session.serie.id.to_s, notice: 'Session was successfully updated.' }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_session
    @session = Session.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def session_params
    params.require(:session).permit(:status, :session_number)
  end
end