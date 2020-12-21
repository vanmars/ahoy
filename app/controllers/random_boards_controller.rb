class RandomBoardsController < ApplicationController
  
  def new
    @random = RandomBoard.new
    render :new
  end

  def create
    @random = RandomBoard.new(random_board_params)
    if @random.save
      flash[:notice] = "Random board successfully created!"
      redirect_to random_board_path(@random.id)
    else 
      flash[:alert] = "There was an error. Please try again."
      render :new
    end
  end

  def show
    @random = RandomBoard.find(params[:id])
    # Make API Call
    quote_object = Quote.new(@random.book_title)
    book_id = quote_object.get_book_id()

    if book_id
      quotes = quote_object.get_quotes(book_id)

      if quotes
        # Grab 16 random quotations from all results
        quotes = quotes.shuffle
        quotes = quotes.slice(0, 16)

        # Create Cards for Game Board
        @out1ev1a = Card.create({text: quotes[0], category: "blue_evidence", color:"blue"})
        @out1ev1b = Card.create({text: quotes[1], category: "blue_evidence", color:"blue"})
        @out1cc1 = Card.create({text: quotes[2], category: "blue_close_call", color:"yellow"})
        @out1rh1 = Card.create({text: quotes[3], category: "blue_red_herring", color:"red"})
        @out1ev2a = Card.create({text: quotes[4], category: "blue_evidence", color:"blue"})
        @out1ev2b = Card.create({text: quotes[5], category: "blue_evidence", color:"blue"})
        @out1cc2 = Card.create({text: quotes[6], category: "blue_close_call", color:"yellow"})
        @out1rh2 = Card.create({text: quotes[7], category: "blue_red_herring", color:"red"})
        @out2ev1a = Card.create({text: quotes[8], category: "green_evidence", color:"green"})
        @out2ev1b = Card.create({text: quotes[9], category: "green_evidence", color:"green"})
        @out2cc1 = Card.create({text: quotes[10], category: "green_close_call", color:"yellow"})
        @out2rh1 = Card.create({text: quotes[11], category: "green_red_herring", color:"red"})
        @out2ev2a = Card.create({text: quotes[12], category: "green_evidence", color:"green"})
        @out2ev2b = Card.create({text: quotes[13], category: "green_evidence", color:"green"})
        @out2cc2 = Card.create({text: quotes[14], category: "green_close_call", color:"yellow"})
        @out2rh2 = Card.create({text: quotes[15], category: "green_red_herring", color:"red"})

        # Shuffle Cards
        data = [ @out1ev1a, @out1ev1b, @out1cc1, @out1rh1, @out1ev2a, @out1ev2b, @out1cc2, @out1rh2, @out2ev1a, @out2ev1b, @out2cc1,  @out2rh1, @out2ev2a, @out2ev2b, @out2cc2, @out2rh2 ]
        @data = data.shuffle

      else
        flash[:alert] = "There was an error. Please search for another book."
        redirect_to :new
      end

    else
      flash[:alert] = "No entry under that name. Please search for another book."
      redirect_to :new
    end
    
    # Determine First Turn
    random = rand(0..3)
    @turn = ""
    if random === 1 
      @turn = "blue"
    else
      @turn = "green"
    end

    render :show
  end

  def destroy
    @random= RandomBoard.find(params[:id])
    @random.destroy
    flash[:notice] = "Random board successfully deleted!"
    redirect_to home_index_path
  end

private
  def random_board_params
    params.require(:random_board).permit(:book_title)
  end

end