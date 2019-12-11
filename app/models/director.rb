class Director < ApplicationRecord
  searchkick word_start: %i[
    first_name
    last_name
  ]

  def search_data
    attributes.merge(
      name: name
    )
  end

  def name
    [first_name, last_name].join(' ')
  end
end
