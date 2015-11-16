class CreateCategoriesTasksJoin < ActiveRecord::Migration
  def up
    create_table 'categories_tasks', :id => false do |t|
    	t.column 'category_id', :integer
    	t.column 'task_id', :integer
    end
  end
  def down
  	drop_table  'categories_tasks'
  end
end
