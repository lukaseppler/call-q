module ApplicationHelper
  def formatted_phone(number)
    Phony.formatted(number)
  end
end
