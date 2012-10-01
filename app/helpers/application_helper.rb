module ApplicationHelper

  # Returns the full title on a per-page basis
  def full_title(page_title)
    base_title = "ILL Requests"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Enables sortable column headings, toggle for asc/desc
  def sortable(column, title)
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end

end
