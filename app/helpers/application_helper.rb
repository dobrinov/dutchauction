module ApplicationHelper

  def javascript_include_controller_specific_file
    filename = "#{params[:controller]}.js"

    if File.exist?(filename)
      javascript_include_tag filename
    else
      nil
    end
  end
end
