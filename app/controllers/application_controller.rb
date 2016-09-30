class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  #[Jerry] for test about the controller OOP
  def foo
    p "Hey from ApplicationController. (Your father)"
  end
end
