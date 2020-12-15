class RandomsController < ApplicationController

  def new
    @random = Random.new
    render :new
  end

  def create
    @random = Random.new(random_params)
    if @random.save
      flash[:notice] = "Random board successfully created!"
      redirect_to random_path(@random.id)
    else 
      flash[:alert] = "There was an error. Please try again."
      render :new
    end
  end

  def show
    @random = Random.find(params[:id])
    # Make API Call
    response1 = HTTParty.get('https://classic-texts-api.herokuapp.com/search?title=' + @random.book_title)
    if response1
      book_id = response.first["id"]
      response2 = HTTParty.get('https://classic-texts-api.herokuapp.com/books/' +  book_id + '/quotes')
      if response2
        quotes = []
        response2.each do | quote |
          quotes.push(quote.content)
        end
        # Grab 16 random quotations
        quotes = quotes.shuffle
        quotes = quotes.slice(0, 16)
        # Create Cards for Game Board
        @out1ev1a = Card.create({text: quotes[0], category: "blue_evidence", color:"blue"})
        @out1ev1b = Card.create({text: quotes[0], category: "blue_evidence", color:"blue"})
        @out1cc1 = Card.create({text: quotes[0], category: "blue_close_call", color:"yellow"})
        @out1rh1 = Card.create({text: quotes[0], category: "blue_red_herring", color:"red"})
        @out1ev2a = Card.create({text: quotes[0], category: "blue_evidence", color:"blue"})
        @out1ev2b = Card.create({text: quotes[0], category: "blue_evidence", color:"blue"})
        @out1cc2 = Card.create({text: quotes[0], category: "blue_close_call", color:"yellow"})
        @out1rh2 = Card.create({text: quotes[0], category: "blue_red_herring", color:"red"})
        @out2ev1a = Card.create({text: quotes[0], category: "green_evidence", color:"green"})
        @out2ev1b = Card.create({text: quotes[0], category: "green_evidence", color:"green"})
        @out2cc1 = Card.create({text: quotes[0], category: "green_close_call", color:"yellow"})
        @out2rh1 = Card.create({text: quotes[0], category: "green_red_herring", color:"red"})
        @out2ev2a = Card.create({text: quotes[0], category: "green_evidence", color:"green"})
        @out2ev2b = Card.create({text: quotes[0], category: "green_evidence", color:"green"})
        @out2cc2 = Card.create({text: quotes[0], category: "green_close_call", color:"yellow"})
        @out2rh2 = Card.create({text: quotes[0], category: "green_red_herring", color:"red"})
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
    @random= Random.find(params[:id])
    @random.destroy
    flash[:notice] = "Random board successfully deleted!"
    redirect_to home_index_path
  end

private
  def quote_params
    params.require(:random).permit(:book_title)
  end

end