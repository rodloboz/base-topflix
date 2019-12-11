class Movie < ApplicationRecord
  belongs_to :director

  scope :ordered, -> { order(rating: :desc) }

  SEARCH_FIELDS = %i[
    title
    synopsis
    genre
    director_first_name
    director_last_name
  ]

  searchkick text_middle: SEARCH_FIELDS, word_start: SEARCH_FIELDS

  def search_data
    attributes.merge(
      director_first_name: director.first_name,
      director_last_name: director.last_name,
      name: name
    )
  end

  def name
    title
  end

  def category
    'Movie'
  end

  def background_cover
    "background-image: url(#{cover}), #{linear_gradient}"
  end

  private

  def linear_gradient
    "linear-gradient(99deg, #{theme_color} 0%, #{theme_color} 64%, #{lighten_theme_color} 100%);"
  end

  def lighten_theme_color
    theme_color.gsub('1)', '0.8)')
  end
end
