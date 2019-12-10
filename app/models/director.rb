class Director < ApplicationRecord
  searchkick word_start: %i[
    first_name
    last_name
  ]

  def name
    [first_name, last_name].join(' ')
  end
end
