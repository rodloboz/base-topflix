class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @movies = Movie.all + Serie.all
  end
end
