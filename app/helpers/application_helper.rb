module ApplicationHelper
  def fixDate(date)
    return date.in_time_zone('Warsaw').to_datetime.strftime("%B %e, %Y at %I:%M %p")
  end
end
