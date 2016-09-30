class AddStageToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :stage, :integer
  end
end
