class Task < ApplicationRecord
  belongs_to :project#!!!! you use project wording here, means you can use Task.last.project to query out all project related this task

  #we want to do the conditional callback for the task
  #after_save will take effect the save from create  and updated.
  #we need implment update_percent_complete and mark_completed
  after_save :update_percent_complete if :mark_completed?

  # add this scope completed method for below "project.tasks."completed".count" to use.
  # find out all completed == true object
  scope :completed, -> { where(completed: true)}


  def mark_completed?
    self.completed == true
  end

  def update_percent_complete
    #to db find which project assocated with this current task.
    project = Project.find(self.project_id)
    #count the number of all tasks which belongs to this project and completed is true.
    count_of_completed_tasks = project.tasks.completed.count
    count_of_total_tasks= project.tasks.count
    # our own model counter.rb will use herer.
    project.update!(percent_complete: Counter.calculate_percent_complete(
                    count_of_completed_tasks,count_of_total_tasks))
  end

end
