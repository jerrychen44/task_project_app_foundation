#[Jerry] build our own models (Class in Ruby)
# you can call this method on console directly.
# ex: Counter.calculate_percent_complete(20,100) => 20
# which means you can call it on ohter in code from file.
class Counter
  def self.calculate_percent_complete(completed_tasks,total_tasks)
    completed_tasks.to_f / total_tasks.to_f * 100
  end
end
