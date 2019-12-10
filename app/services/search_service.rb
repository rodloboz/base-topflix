class SearchService < BaseService
  def initialize(term)
    @term = term || '*'
  end

  def call
    Searchkick.search(@term,
      index_name: [Movie, Serie],
      match: :text_middle
    )
  end
end
