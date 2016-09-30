class RemoveDivisionFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :division, :string
  end
end
