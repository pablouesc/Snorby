# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  ## Signature Data
  def get_sig_type_for?(s)
    SigClass.find(s).sig_class_name.titleize
  end
  ## END


  ## Encoding Data
  def get_encoding_for?(s)
    Encoding.find_by_encoding_type(s).encoding_text
  end
  ## END

  ## Reference Data
  def get_ref_type_for?(s)
    r_s_n = Reference.find_by_ref_id(s)
    ReferenceSystem.find_by_ref_system_id(r_s_n.ref_id).ref_system_name
  end

  def get_ref_data_for?(s)
    Reference.find_by_ref_id(s).ref_tag
  end
  ## END

  ## Severity
  def severity_image(s)
    if s == 1
      "<p>#{image_tag('severity/high.png')}</p>"
    elsif s == 2
      "#{image_tag('severity/warn.png')}"
    else
      "#{image_tag('severity/low.png')}"
    end
  end
  ## END

  def no_data
    "<tr><td><span id='no_data_holder'>#{image_tag('no_data.png', :size=>'12x12', :id=>'no_data')} No Data Available!</font></td></tr>"
  end

  def toggle_div(div)
    update_page do |page|
      page[div].toggle
      page[div].visual_effect :highlight
    end
  end

  def fade_div(div)
    update_page do |page|
      page[div].visual_effect :fade
    end
  end
end
