class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  before_action :set_customers, only: %i[ new edit create destroy update]

  # GET /movies or /movies.json
  def index
    @pagy, @movies = pagy(Movie.all.order(id: :desc))

    if params[:query_text].present?
      @pagy, @movies = pagy(Movie.search_full_text(params[:query_text]))
    end
  end

  def search
  end

  # GET /movies/1 or /movies/1.json
  def show
    @movies = Movie.all
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
    @customers = Customer.all.pluck(:name, :id)
    @numerador = @movie.customer_id
    @picture_a = @movie.picture
    @moviegatekeep = true
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Película creada con éxito :)" }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Película actualizada con éxito :)" }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Película eliminada con éxito." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id]) #Movie.includes(:customer).find(params[:id])
    end

    def set_customers
      @customers = Customer.all.pluck(:name, :id)
    end


    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:name, :customer_id, :picture)
    end
end
