class TranslationSystem
  def self.create!(locale, scope, key, content)
    sender = Localeapp::Sender.new
    sender.post_translation(locale.to_s, key, { :scope => scope }, content)
  end
end