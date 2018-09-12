class User < ApplicationRecord
  include Clearance::User

  has_many :recipes
  has_many :planners

  def recipe_options
    recipes.map do |recipe|
      [recipe.title, recipe.id]
    end
  end


end
