module ApplicationHelper
  def page_title(page_title)
    default_title = 'Inst'
    page_title.present? ? page_title : default_title
  end
end
