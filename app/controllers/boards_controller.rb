class BoardsController < ApplicationController

  def new
    @board = Board.new
    render :new
  end

  def create
    @board = Board.new(board_params)
    @outline1 = Outline.find(@board.outline_id_1.to_i)
    @outline2 = Outline.find(@board.outline_id_2.to_i)
    @board.outlines << @outline1
    @board.outlines << @outline2
    if @board.save
      flash[:notice] = "Board successfully created!"
      redirect_to board_path(@board.id)
    else 
      flash[:alert] = "There was an error. Please try again."
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
    @data = []
    @board.outlines.each do |outline|
      @data << outline.evidece_1a
      @data << outline.evidence_1b
      @data << outline.close_call_1
      @data << outline.red_herring_1
      @data << outline.evidece_2a
      @data << outline.evidece_2b
      @data << outline.close_call_2
      @data << outline.red_herring_2
    end
    render :show
  end


  


  
  def index
    @boards = Board.all 
    render :index
  end

  def edit
    @board = Board.find(params[:id])
    render :edit
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      flash[:notice] = "Board successfully updated!"
      redirect_to board_path(@board)
    else  
      flash[:alert] = "There was an error. Please try again."
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    flash[:notice] = "Board successfully deleted!"
    redirect_to outlines_path
  end

private
  def board_params
    params.require(:board).permit(:name, :outline_id_1, :outline_id_2)
  end
end