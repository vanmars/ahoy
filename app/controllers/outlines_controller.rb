class OutlinesController < ApplicationController
  before_action :set_user

  def index
    @outlines = @user.outlines
    render :index
  end

  def new
    @outline = @user.outlines.new
    render :new
  end

  def create
    @outline = @user.outlines.new(outline_params)
    if @outline.save
      flash[:notice] = "Outline successfully added!"
      redirect_to outlines_path
    end
  end

  def show
    @outline = Outline.find(params[:id])
    render :show
  end

  def edit
    @outline = Outline,find(params[:id])
    render :edit
  end

  def update
    @outline = Outline.find(params[:id])
    if @outline.update(outline_params)
      flash[:notice] = "Outline successfully updated!"
      redirect_to outline_path(@outline)
    else 
      flash[:alert] = "Outline not updated. Plese try again."
      render :edit
    end
  end

  def destroy
    @outline = Outline.find(params[:id])
    @outline.destroy
    flash[:notice] = "Outline successfully deleted."
    redirect_to outlines_path
  end

private
  def set_user
    @user = current_user
  end

  def outline_params
    params.require(:outline).permit(:claim_1, :evidence_1a, :evidence_1b, :close_call_1, :red_herring_1, :claim_2, :evidence_2a, :evidence_2b, :close_call_2, :red_herring_2)
  end

end