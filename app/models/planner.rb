class Planner < ApplicationRecord
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true

  has_many :meals, -> { order(:date) }, inverse_of: :planner, dependent: :destroy
  accepts_nested_attributes_for :meals

  def plan_meals
    user_recipe_ids = user.recipes.pluck(:id)

    (start_date..end_date).each do |date|
      available_recipe_ids = user_recipe_ids - meals.map(&:recipe_id)
      meals.build(date: date, recipe_id: available_recipe_ids.sample)
    end
  end

  def to_s
    "#{start_date} - #{end_date}"
  end

end
