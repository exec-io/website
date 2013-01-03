class ApplicationController < ActionController::Base

  before_filter :redirect_to_charges_page

  protect_from_forgery

  private

  def redirect_to_charges_page
    Rails.logger.warn("Got request from: '#{request.host}'")
    if /exec-io.com$/ =~ request.host
      redirect_to 'http://exec.io/charge'
    end
  end

end
