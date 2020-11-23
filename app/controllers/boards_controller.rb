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
    @outline1 = @board.outlines[0]
    @outline2 = @board.outlines[1]

    @out1ev1a = Card.create({text: @outline1.evidence_1a, type: "evidence", color:"blue"})
    @out1ev1b = Card.create({text: @outline1.evidence_1b, type: "evidence", color:"blue"})
    @out1cc1 = Card.create({text: @outline1.close_call_1, type: "evidence", color:"yellow"})
    @out1rh1 = Card.create({text: @outline1.red_herring_1, type: "evidence", color:"red"})
    @out1ev2a = Card.create({text: @outline1.evidence_2a, type: "evidence", color:"blue"})
    @out1ev2b = Card.create({text: @outline1.evidence_2b, type: "evidence", color:"blue"})
    @out1cc2 = Card.create({text: @outline1.close_call_2, type: "evidence", color:"yellow"})
    @out1rh2 = Card.create({text: @outline1.red_herring_2, type: "evidence", color:"red"})

    @out2ev1a = Card.create({text: @outline2.evidence_1a, type: "evidence", color:"blue"})
    @out2ev1b = Card.create({text: @outline2.evidence_1b, type: "evidence", color:"blue"})
    @out2cc1 = Card.create({text: @outline2.close_call_1, type: "evidence", color:"yellow"})
    @out2rh1 = Card.create({text: @outline2.red_herring_1, type: "evidence", color:"red"})
    @out2ev2a = Card.create({text: @outline2.evidence_2a, type: "evidence", color:"blue"})
    @out2ev2b = Card.create({text: @outline2.evidence_2b, type: "evidence", color:"blue"})
    @out2cc2 = Card.create({text: @outline2.close_call_2, type: "evidence", color:"yellow"})
    @out2rh2 = Card.create({text: @outline2.red_herring_2, type: "evidence", color:"red"})

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