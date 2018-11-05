module ApplicationHelper

  def previous_label
    ('<i class="fa fa-chevron-circle-left fa-lg"></i>').html_safe
  end

  def next_label
    ('<i class="fa fa-chevron-circle-right fa-lg"></i>').html_safe
  end
end
