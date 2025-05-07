class CategoriesController < SecuredController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = @account.categories
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    begin
      @category = @account.categories.build(category_params)
      if @category.save
        flash[:notice] = 'Category Added Successfully'
        redirect_back(fallback_location: root_path)
      end
    rescue => exception
      flash[:alert] = exception.message
      redirect_back(fallback_location: root_path)
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    begin
      if @category.update(category_params)
        flash[:notice] = 'Category Updated Successfully'
        redirect_back(fallback_location: root_path)
      end
    rescue => exception
      flash[:alert] = exception.message
      redirect_back(fallback_location: root_path)
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    begin 
      @category = @account.categories.find_by_id(params[:id])
      @category.destroy
      flash[:notice] = 'Category Deleted Successfully'
      redirect_back(fallback_location: root_path)
    rescue => exception 
      flash[:alert] = exception.message
      redirect_back(fallback_location: root_path)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      # params.fetch(:category, {})
      params.require(:category).permit(:name, :description, :status)
    end
end
