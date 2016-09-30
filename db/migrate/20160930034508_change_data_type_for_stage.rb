class ChangeDataTypeForStage < ActiveRecord::Migration[5.0]
  def change
    #thie is empty at first beginning after we type
    # rails g migration change_data_type_for_stage

    #change_column :tablename, variablename, type
    change_column :projects, :stage, :string
  end
end
