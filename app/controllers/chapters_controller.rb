class ChaptersController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_chapter, only: %i[ show edit update destroy ]
  layout 'devise'

  # GET /chapters or /chapters.json
  def index
    @chapters = Chapter.all
  end

  # GET /chapters/1 or /chapters/1.json
  def show
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
    @heading = "New Chapter"
  end

  # GET /chapters/1/edit
  def edit
    @heading = "Edit Chapter"
  end

  # POST /chapters or /chapters.json
  def create
    @chapter = Chapter.new(chapter_params)

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to pages_path, notice: "Chapter was successfully created." }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1 or /chapters/1.json
  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to pages_path, notice: "Chapter was successfully updated." }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1 or /chapters/1.json
  def destroy
    @chapter.destroy!

    respond_to do |format|
      format.html { redirect_to pages_path, notice: "Chapter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chapter_params
      params.require(:chapter).permit(:name, :chapter_number)
    end

    def require_login
      unless admin_signed_in?
        redirect_to root_path
      end
    end
end
