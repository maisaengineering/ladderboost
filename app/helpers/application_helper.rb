module ApplicationHelper

  #Navigation Link if current_page is true add the class 'active'
  # link_to 'some',path,class: "#{active_class?(path)} additional_class"
  def active_class?(path)
    'active' if current_page?(path)
  end

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

end
