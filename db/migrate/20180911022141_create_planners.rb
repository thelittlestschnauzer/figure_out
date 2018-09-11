class CreatePlanners < ActiveRecord::Migration[5.2]
  def change
    create_table :planners do |t|
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true
    end
  end
end
