class Task < ApplicationRecord
  belongs_to :project#!!!! you use project wording here, means you can use Task.last.project to query out all project related this task
end
