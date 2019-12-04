class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  # GET /publications
  # GET /publications.json
  def index
    query = Publication.joins(:authors).references(:authors)

    if params[:phrase]
      query = query.where(
        'isbn LIKE ? OR title LIKE ? OR authors.email LIKE ?',
        "%#{params[:phrase]}%", "%#{params[:phrase]}%", "%#{params[:phrase]}%"
      )
    end

    smart_listing_create :publications,
                           query,
                           partial: "publications/list"

    # query = Publication.includes(:authors).references(:authors)
    # query = query.where('isbn LIKE ?', "%#{params[:isbn]}%") if params[:isbn].present?
    # query = query.where('authors.email LIKE ?', "%#{params[:email]}%") if params[:email].present?
    # @publications = query.order("publication_type asc, title asc, authors.firstname asc")
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  # POST /publications.json
  def create
    @publication = Publication.new(publication_params)

    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:title, :description, :isbn, :published_at)
    end
end
