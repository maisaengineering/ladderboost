module ApplicationHelper

  #Navigation Link if current_page is true add the class 'active'
  # link_to 'some',path,class: "#{active_class?(path)} additional_class"
  def active_class?(path)
    'active' if current_page?(path)
  end

end
