class BookPagesController < ApplicationController
  before_action :set_book_page, only: %i[ show edit update destroy ]

  # GET /book_pages or /book_pages.json
  def index
    if params[:query]
      @book_pages = BookPage.search_body(params[:query]).paginate(page: params[:page])
    else
      @book_pages = BookPage.paginate(page: params[:page])
    end
  end

  # GET /book_pages/1 or /book_pages/1.json
  def show
  end

  # GET /book_pages/new
  def new
    @book_page = BookPage.new
  end

  # GET /book_pages/1/edit
  def edit
  end

  # POST /book_pages or /book_pages.json
  def create
    @book_page = BookPage.new(book_page_params)

    respond_to do |format|
      if @book_page.save
        format.html { redirect_to book_page_url(@book_page), notice: "Book page was successfully created." }
        format.json { render :show, status: :created, location: @book_page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_pages/1 or /book_pages/1.json
  def update
    respond_to do |format|
      if @book_page.update(book_page_params)
        format.html { redirect_to book_page_url(@book_page), notice: "Book page was successfully updated." }
        format.json { render :show, status: :ok, location: @book_page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_pages/1 or /book_pages/1.json
  def destroy
    @book_page.destroy

    respond_to do |format|
      format.html { redirect_to book_pages_url, notice: "Book page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_page
      @book_page = BookPage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_page_params
      params.require(:book_page).permit(:body)
    end
end
