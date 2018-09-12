class Meal <ApplicationRecord
  belongs_to :recipe
  belongs_to :planner 
  belongs_to :meal, inverse_of: :meals

  validates :date, presence: true
  validates :planner, presence: true
  validates :recipe, presence: true
end
