class SearchService < BaseService
  def initialize(term)
    @term = term
  end

  def call
    Searchkick.search(@term,
      index_name: [Movie, Serie, Director],
      fields: ["title^5", "first_name", "last_name", "director_first_name", "director_last_name"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
      ).map { |result| { type: result._type, name: result.name.titleize } }.uniq
  end
end
