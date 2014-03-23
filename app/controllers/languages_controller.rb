class LanguagesController < ApplicationController

  before_action :check_session, :except => [:index, :show]


  def index
    @languages = Language.sorted
  end

  def show
    @language = Language.find(params[:id]);
  end

  def edit
    @language = Language.find(params[:id]);
  end

  def update
    @language = Language.find(params[:id])
    if @language.update_attributes(section_params)
      flash[:notice] = "Language updated successfully."
      redirect_to(:action => 'show', :id => @language.id)
    else
      render('edit')
    end
  end

  def delete
    @language = Language.find(params[:id]);
  end

  def destroy
    @language = Language.find(params[:id]).destroy();
    flash[:notice] = "Language deleted successfully."
    redirect_to(:action => 'index')
  end

  def create
    @language = Language.new()
  end

  def new
    @language = Language.new(section_params)
    if @language.save
      flash[:notice] = "Language created successfully."
      redirect_to(:action => 'index')
    else
      render('create')
    end
  end


  private def section_params
    params.require(:language).permit(:name, :difficulty)
  end

end
