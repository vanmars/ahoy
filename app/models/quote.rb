class Quote

  def initialize(title)
    @title = title
  end

  def get_book_id
    response = HTTParty.get('https://classic-texts-api.herokuapp.com/search?title=' + @title)
    if response 
       book_id = response.first["id"]
  end

  def get_quotes(id)
    response = HTTParty.get('https://classic-texts-api.herokuapp.com/books/' +  id + '/quotes'
  end

end