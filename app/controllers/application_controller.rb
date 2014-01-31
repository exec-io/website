class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper :all

  before_filter :set_locale
  before_filter :set_browser_type
  require 'twitter'

  def exec_io_twitter
    Twitter.user_timeline("exec_io")
  end
  
  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  def set_browser_type
    @browser_type = detect_browser
    @browser_type
  end

  private

  def not_found!
    raise ActionController::RoutingError.new('Not Found')
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # http://www.falsepositives.com/index.php/2011/09/16/detecting-a-mobile-browser-on-the-server-in-your-rails-app/
  MOBILE_BROWSERS = ["playbook", "windows phone", "android", "ipod", "iphone", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]

  def detect_browser
    header = request.headers["HTTP_USER_AGENT"]
    agent = header.present? ? header.downcase : "max-head-room"

    MOBILE_BROWSERS.each do |m|
      return "mobile" if agent.match(m)
    end
    return "desktop"
  end

end
