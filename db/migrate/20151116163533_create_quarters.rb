class CreateQuarters < ActiveRecord::Migration
  def change
    create_table :quarters do |t|
      t.integer :number

      t.timestamps null: false
    end
  end
end
