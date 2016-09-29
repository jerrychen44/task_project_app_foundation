class PagesController < ApplicationController
  def contact
  end

  def about
    @title ="Jerry My call page"
  end

  def home
    @projects=Project.all
  end
end
