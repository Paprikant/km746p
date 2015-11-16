json.array!(@tasks) do |task|
  json.extract! task, :id, :description, :frequency, :quartals, :duration_min, :duration_max
  json.url task_url(task, format: :json)
end
