module TasksHelper
  def GetTask
    return Task.where("frequency > " + rand(100).to_s ).limit(1).order("RAND()")
  end

  def GetWeek
    hours=0
    counter=0
    selection = Array.new(0)
 
    # Get Tasks until we have more than 8 hours filled
    until hours >= 8
      tasks = GetTask()
      tasks.each do |task|
        time = rand(task.duration_min...task.duration_max+0.5).round(2)
        selection << {task.description => time}
        hours = hours + time
      end
    end
    task_last = selection.last.keys[0]
    time_last = (selection.last.values[0] -(hours-8)).round(2)
    
    selection.pop
    selection << {task_last => time_last}
	return selection
  end

# Draw a row for every Task exept the last %>
#    counter = 0
#    result=Array.new
#    while counter < selection.length-1
#     times[counter]
#      task = @Selection[counter]
#      task.description
#    
#	  <% @Counter = @Counter+1
#    end
#
#      (times[tounter]-(hours-8)).round(2)
#      task = selection[counter]
#      task.description
#	end
# end
end
