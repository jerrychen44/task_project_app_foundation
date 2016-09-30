class Project < ApplicationRecord
  #[Jerry] what should be put in in model
  #all logical alog.
  #add Custom scopes here
  #add defaults here.
  #integrate validataion here.
  #integrate callbacks
  #integrating database relationships
############################################

  #############
  # add defaults
  ##############
  # the method set_defaults we will add below
  # and means when Object initialized, then it will run
  # the set_defaults method, it is the timing to set some default value
  # (Or you can set when you create the db)
  # Don't use after_create, time is not right, will weap out the value you have.
  after_initialize :set_defaults



  #######################
  # integrate validataion here
  ######################
  validates_presence_of :title, :description, :percent_complete




  ################
  #Custom scopes #
  ###############
  #this can be called from controller.
  scope :almost_completed, -> { where('percent_complete > 75.0')}
  scope :still_needs_some_work, -> { where('percent_complete < 75.0')}


  def set_defaults
    # || = , means, if the percent_complete has value , keep it.
    # if set_defaults == nil, then set it to 0.0
    self.percent_complete ||= 0.0
  end

end
