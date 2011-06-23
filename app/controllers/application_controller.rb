class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include CategoriesHelper
  # add 06/22/2011
  def current_category=(category_id)
    @current_category = category_id
  end
  # add 06/22/2011
  def current_category
    @current_category
  end
end
