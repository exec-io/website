module ApplicationHelper
  def enabled_locales
    ["hu", "sk", "ru", "zh-TW"].map(&:to_sym)
  end

  def random_link_color
    return ["red", "blue", "green", "orange"].sample
  end
end
