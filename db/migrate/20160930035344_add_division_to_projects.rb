class AddDivisionToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :division, :string
  end
end
