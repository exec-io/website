module ApplicationHelper
  def enabled_locales
    ["en", "ja", "zh-TW"].map(&:to_sym)
  end
end
