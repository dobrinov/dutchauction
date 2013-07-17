module ApplicationHelper

  def faye_client
    "#{faye_protocol}#{faye_host}:#{faye_port}/faye"
  end

  def faye_js
    "#{faye_protocol}#{faye_host}:#{faye_port}/faye.js"
  end

  def faye_protocol
    request.protocol
  end

  def faye_host
    request.host
  end

  def faye_port
    9292
  end

  def javascript_include_controller_specific_file
    filename = "#{params[:controller]}.js"

    if File.exist?(filename)
      javascript_include_tag filename
    else
      nil
    end
  end
end
