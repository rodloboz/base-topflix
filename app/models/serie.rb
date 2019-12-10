class Serie < ApplicationRecord
  searchkick text_middle: %i[
    title
    synopsis
    genre
  ]

  def name
    title
  end

  def category
    'TV Series'
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