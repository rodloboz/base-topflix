class AutocompletesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    suggestions = AutocompleteService.call(params[:q]).take(5)
    suggestions.map! do |suggestion|
      render_to_string(
        partial: 'shared/suggestion',
        locals: { suggestion: suggestion }
      )
    end

    render json: suggestions
  end
end
