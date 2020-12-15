class RandomController < ApplicationController

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
    title = @random.book_title
    response1 = HTTParty.get('https://classic-texts-api.herokuapp.com/search?title=' + title)
    if response1
      book_id = response.first["id"]
    else
      flash[:alert] = "No entry under that name. Please search for another book."
      redirect_to :new
    end
    response2 = HTTParty.get('https://classic-texts-api.herokuapp.com/books/' +  book_id + '/quotes'
    if response2
      quotes = []
      response2.each do | quote |
        quotes.push(quote.content)
      end
      quotes = quotes.shuffle
      quotes = quotes.slice(0, 16)
      # Create Cards
      # @data = data.shuffle
    else
      flash[:alert] = "There was an error. Please search for another book."
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