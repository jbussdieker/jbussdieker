module RailscastsHelper
  def watched_progress(railscasts)
    watched = railscasts.length
    percent = watched.to_f / Railscast.all.length * 100
    content_tag(:div, :class => 'progress') do
      content_tag(:div, "", :class => 'bar', :style => "width: #{percent}%;")
    end
  end

  def pro_or_revised_badge(railscast)
    if railscast.revised
      content_tag(:span, "Revised", :class => 'label label-info')
    else
      if railscast.pro
        content_tag(:span, "Pro", :class => 'label label-important')
      end
    end
  end
end
