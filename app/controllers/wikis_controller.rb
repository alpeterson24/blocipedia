class WikisController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.create(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error creating your wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    authorize @wiki

    if @wiki.save
        flash[:notice] = "Wiki was updated"
        redirect_to @wiki
    else
        flash.now[:alert] = "Error saving wiki. Please try again."
        render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    if @wiki.destroy
        flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
        redirect_to wikis_path
    else
        flash.now[:alert] = "There was an error deleting the wiki"
        render :show
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end

end
