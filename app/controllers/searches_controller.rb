class SearchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    term = params.dig(:search, :query).presence
    @movies = SearchService.call(term)
  end
end
