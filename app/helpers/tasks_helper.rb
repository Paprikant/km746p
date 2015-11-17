module TasksHelper
	def GetTask
		return Task.where("frequency > " + rand(100).to_s ).limit(1).order("RAND()")
	end
end
