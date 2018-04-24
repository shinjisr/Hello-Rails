module ApplicationHelper
  def user_gender(gender) # A view helper used to define gender.
    if gender == 1
      "Male"
    elsif gender == 0
      "Female"
    else
      "You tell me."
    end
  end

  def icon_link_to(label, path, icon)
    link_to path do
      content_tag :span, class: "glyphicon glyphicon-#{icon}" do
        label
      end
    end
  end
end
