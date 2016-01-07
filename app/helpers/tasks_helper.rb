module TasksHelper

  # This Method will select a random task from the database
  def GetTask(categories)
    # Transform category array into sql syntax - ("1", "2")
    category_filter = categories.to_s.gsub("[", "(").gsub("]", ")")
    
    # Get a random Task with given categories
    sql='SELECT t1.id 
         FROM tasks t1 inner join categories_tasks t2 on t1.id = t2.task_id 
         WHERE (t1.frequency > '+rand(100).to_s+') AND t2.category_id in '+category_filter+'
         ORDER BY RAND()
         LIMIT 1;'
    connection = ActiveRecord::Base.connection
    result = connection.execute(sql)

    # Get the whole object and return it
    result.each() do |r|
      logger.info(r.to_s)
        return Task.where('id = "' + r[0].to_s + '"').limit(1);
    end
  end

  # This Method will fill 8 hours with tasks
  def GetDay(categories)
    #ogger.info(Parameters);
    # Init variables
    hours=0
    counter=0
    selection = Array.new(0)
    # Get Tasks until we have more than 8 hours filled
    until hours >= 8
      tasks = GetTask(categories)
      tasks.each do |task|
        time = rand(task.duration_min...task.duration_max+0.5).round(2)
        selection << {task.description => time}
        hours = hours + time
      end
    end
    # Make last task shorter to meet 8 hours
    task_last = selection.last.keys[0]
    time_last = (selection.last.values[0] -(hours-8)).round(2)
    
    # Replace last task with shortenden version
    selection.pop
    selection << {task_last => time_last}

    # Return the Selection (Array of Hashes)
	  return selection
  end

end
