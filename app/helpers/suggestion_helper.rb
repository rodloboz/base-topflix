module SuggestionHelper
  TYPE_ICONS = {
    director: 'video',
    movie: 'film',
    serie: 'tv'
  }
  def suggestion_icon(type)
    return unless type

    TYPE_ICONS[type.to_sym] 
  end
end
