module ApplicationHelper
  def enabled_locales
    ["en", "ja", "zh-TW"].map(&:to_sym)
  end

  def random_link_color
    return ["red", "blue", "green", "orange"].sample
  end
end
