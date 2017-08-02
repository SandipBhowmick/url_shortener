# Rails default file which added to all views
module ApplicationHelper
  def error_messages_for(object)
    render(partial: 'application/error_messages', locals: { object: object })
  end
end
