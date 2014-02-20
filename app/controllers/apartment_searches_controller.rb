class ApartmentSearchesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_apartment_search, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /apartment_searches
  # GET /apartment_searches.json
  def index
    @apartment_searches = current_user.apartment_searches
  end

  # GET /apartment_searches/1
  # GET /apartment_searches/1.json
  def show
    @apartments = Apartment.all
    @apartments = @apartments.where("price > ?", @apartment_search.min_price) if @apartment_search.min_price
    @apartments = @apartments.where("price < ?", @apartment_search.max_price) if @apartment_search.max_price
    @apartments = @apartments.order(sort_column + " " + sort_direction)
  end

  # GET /apartment_searches/new
  def new
    @apartment_search = current_user.apartment_searches.new
  end

  # GET /apartment_searches/1/edit
  def edit
  end

  # POST /apartment_searches
  # POST /apartment_searches.json
  def create
    @apartment_search = current_user.apartment_searches.new(apartment_search_params)

    respond_to do |format|
      if @apartment_search.save
        format.html { redirect_to @apartment_search, notice: 'Apartment search was successfully created.' }
        format.json { render action: 'show', status: :created, location: @apartment_search }
      else
        format.html { render action: 'new' }
        format.json { render json: @apartment_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartment_searches/1
  # PATCH/PUT /apartment_searches/1.json
  def update
    respond_to do |format|
      if @apartment_search.update(apartment_search_params)
        format.html { redirect_to @apartment_search, notice: 'Apartment search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @apartment_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartment_searches/1
  # DELETE /apartment_searches/1.json
  def destroy
    @apartment_search.destroy
    respond_to do |format|
      format.html { redirect_to apartment_searches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment_search
      @apartment_search = current_user.apartment_searches.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_search_params
      params.require(:apartment_search).permit(:title, :min_price, :max_price)
    end

    def sort_column
      Apartment.column_names.include?(params[:sort]) ? params[:sort] : "posted_at"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
