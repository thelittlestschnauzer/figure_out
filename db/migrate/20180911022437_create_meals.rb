class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.date :date, null: false
      t.references :planner, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      
    end
  end
end
