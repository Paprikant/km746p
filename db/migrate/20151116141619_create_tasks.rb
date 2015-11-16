class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :frequency
      t.string :quartals
      t.integer :duration_min
      t.integer :duration_max

      t.timestamps null: false
    end
  end
end
