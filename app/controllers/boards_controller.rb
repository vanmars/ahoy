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
    # Get outline data belonging to board
    @outline1 = @board.outlines[0]
    @outline2 = @board.outlines[1]
    # Generate Cards
    @out1ev1a = Card.create({text: @outline1.evidence_1a, category: "blue_evidence", color:"blue"})
    @out1ev1b = Card.create({text: @outline1.evidence_1b, category: "blue_evidence", color:"blue"})
    @out1cc1 = Card.create({text: @outline1.close_call_1, category: "blue_close_call", color:"yellow"})
    @out1rh1 = Card.create({text: @outline1.red_herring_1, category: "blue_red_herring", color:"red"})
    @out1ev2a = Card.create({text: @outline1.evidence_2a, category: "blue_evidence", color:"blue"})
    @out1ev2b = Card.create({text: @outline1.evidence_2b, category: "blue_evidence", color:"blue"})
    @out1cc2 = Card.create({text: @outline1.close_call_2, category: "blue_close_call", color:"yellow"})
    @out1rh2 = Card.create({text: @outline1.red_herring_2, category: "blue_red_herring", color:"red"})
    @out2ev1a = Card.create({text: @outline2.evidence_1a, category: "green_evidence", color:"green"})
    @out2ev1b = Card.create({text: @outline2.evidence_1b, category: "green_evidence", color:"green"})
    @out2cc1 = Card.create({text: @outline2.close_call_1, category: "green_close_call", color:"yellow"})
    @out2rh1 = Card.create({text: @outline2.red_herring_1, category: "green_red_herring", color:"red"})
    @out2ev2a = Card.create({text: @outline2.evidence_2a, category: "green_evidence", color:"green"})
    @out2ev2b = Card.create({text: @outline2.evidence_2b, category: "green_evidence", color:"green"})
    @out2cc2 = Card.create({text: @outline2.close_call_2, category: "green_close_call", color:"yellow"})
    @out2rh2 = Card.create({text: @outline2.red_herring_2, category: "green_red_herring", color:"red"})
    # Randomize Data Output
    data = [ @out1ev1a, @out1ev1b, @out1cc1, @out1rh1, @out1ev2a, @out1ev2b, @out1cc2, @out1rh2, @out2ev1a, @out2ev1b, @out2cc1,  @out2rh1, @out2ev2a, @out2ev2b, @out2cc2, @out2rh2 ]
    @data = data.shuffle
    # Determine First Turn
    random = rand(1..2)
    @turn = ""
    if random === 1 
      @turn = "blue"
    else
      @turn = "green"
    end
    render :show
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    flash[:notice] = "Board successfully deleted!"
    redirect_to home_index_path
  end

private
  def board_params
    params.require(:board).permit(:name, :outline_id_1, :outline_id_2)
  end
end