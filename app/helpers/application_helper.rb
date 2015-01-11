module ApplicationHelper
  def is_category_active?(category=nil)
    if category
      params[:category_id].to_i == category.id
    else
      !params.has_key?(:category_id)
    end
  end
end
