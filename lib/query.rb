class Query
  attr_reader :search_terms

  def initialize(query)
    raise ArgumentError if query == nil || query == ""
    @query = search_terms
  end

end #class end
