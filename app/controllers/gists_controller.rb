class GistsController < ApplicationController
  def index
    @gists = Gist.sorted
  end

  def show
    @gist = Gist.find(params[:id]);
    if !@gist.gist_edits.empty?
      @gistEdits = @gist.gist_edits
    end

    end

  def create
    @gist = Gist.new();
    @languages = Language.sorted
  end

  def new
    @gist = Gist.new(section_params)
    if @gist.save
      flash[:notice] = "Gist created successfully."
      redirect_to(:action => 'index')
    else
      render('create')
    end
  end

  def edit
    @gist = Gist.find(params[:id])
    @languages = Language.sorted
  end

  def update
    @gist = Gist.find(params[:id])
    if @gist.update_attributes(section_params)
      flash[:notice] = "Gist updated successfully."
      redirect_to(:action => 'show', :id => @gist.id)
    else
      render('edit')
    end
  end

  def delete
    @gist = Gist.find(params[:id]);
  end

  def destroy
    Gist.find(params[:id]).destroy;
    redirect_to(:action => 'index')
  end

  private def section_params
            params.require(:gist).permit(:snippet, :language_id, :description)
          end
end
