class Highlight < ApplicationRecord
  belongs_to :competitor_1, class_name: 'Competitor'
  belongs_to :competitor_2, class_name: 'Competitor'
  belongs_to :source
end
