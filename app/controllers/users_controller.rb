class UsersController < ApplicationController
  include Secured
  layout 'all_layout'
  before_action :set_user, only: %i[show edit update destroy change_level create_child new_child statistics]
  before_action :admin?, only: %i[index change_level]
  before_action :logged_in?, only: %i[show edit update destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @wasted_time = Seen.where(user: @user).map(&:chapter).map(&:duration).sum
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def statistics
    @child = User.find params[:child_id]
    seen_chapters = Seen.where(user: @child).map(&:chapter)
    @total_time = 0
    @time_per_genre = {}
    Genre.pluck(:genre).map { |g| @time_per_genre[g] = 0 }
    seen_chapters.each do |sc|
      sc.serie.genres.pluck(:genre).each do |genre|
        @time_per_genre[genre] += sc.duration
      end
      @total_time += sc.duration
    end
  end

  def new_child
    @child = User.new
    @genres = Genre.all
  end

  def delete_seen
    @user = current_user
    @chapter = Chapter.find(params[:chapter_id])
    @season = @chapter.session
    @seen = @user.seen.find_by(chapter_id: @chapter.id, user_id: @user.id)
    if @seen.nil?
      @user.create_seen(@chapter.id)
    else
      @seen.delete_seen
    end

    redirect_to series_session_path(@season.serie.id, @season)
  end

  def create_child
    @child = @user.children.build child_params
    respond_to do |format|
      if @child.save
        @child.child!
        @user.children << @child
        @child.child_filters.create child_filters_params

        format.html { redirect_to user_path(@user), notice: 'Child was successfully created.' }
        format.json { render :show, status: :created, location: @child }
      else
        format.html { render :new }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change_level
    @user.change_level
    redirect_to users_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def child_params
    params.require(:user).permit(:name, :email, :password)
  end

  def child_filters_params
    child_filters = []
    params[:filters].each do |x|
      child_filters << { genre_id: x }
    end
    child_filters
  end
end
