module ApplicationHelper
  def flash_message
    format_flash_message(:notice) || format_flash_message(:error)
  end

  private

  def format_flash_message(type)
    if flash[type]
      content_tag :div, class: "#{type} message" do
        content_tag :p do
          flash[type]
        end
      end
    end
  end
end
