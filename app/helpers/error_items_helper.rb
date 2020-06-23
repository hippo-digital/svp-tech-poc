# frozen_string_literal: true

module ErrorItemsHelper
  def error_items(field)
    if flash[:validation]&.select { |key| key.to_s.match(field) }&.any?
      sanitize(flash[:validation]
        .select { |key| key.to_s.match(field) }
        .map { |error| error[:text] }.uniq
        .join('<br>'))
    end
  end
end
