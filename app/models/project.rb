class Project < ApplicationRecord
  #[Jerry] what should be put in in model
  #all logical alog.
  #add Custom scopes herer
  #add defaults here.
  #integrate validataion herer.
  #integrate callbacks
  #integrating database relationships
############################################
  #Custom scopes

  #this can be called from controller.
  scope :almost_completed, -> { where('percent_complete > 75.0')}
  scope :still_needs_some_work, -> { where('percent_complete < 75.0')}

end
