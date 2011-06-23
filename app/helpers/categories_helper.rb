module CategoriesHelper
  # add 06/22/2011
  def post_ad_of(category_id)
    current_category = category_id
  end
  # add 06/22/2011
  def current_category=(category_id)
    @current_category = category_id
  end
  # add 06/22/2011
  def current_category
    @current_category
  end
  
end
