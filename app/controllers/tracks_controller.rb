class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  #has_scope :first_name
  # GET /tracks
  # GET /tracks.json
#   def next
#      @tracks = Track.all
#   Track.where(["email_address > ?", email_address]).first
# end
  def index
    @tracks = Track.all
   #@products = Product.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    @tracks = Track.filter(params.slice(:first_name, :last_name, :email_address))
    #@tracks = Track.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])


  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
  end

  # GET /tracks/new
  def new
    @track = Track.new
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = Track.new(track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to @track, notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
   @track = Track.find(params[:id])
   @track.destroy
   
   respond_to do |format|
      format.html { redirect_to tracks_url }
      format.json { head :no_content, notice: 'track successfullyis destroyed' }
      format.js   { render :layout => false }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:first_name, :last_name, :email_address, :phone_number, :company_name)
    end

end
