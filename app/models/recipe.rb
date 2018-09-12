class Recipe < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: { scope: :user_id }

  def to_s
    title
  end 
end
