class ApplicationController < ActionController::Base
  protect_from_forgery

  def redirect_to_charges_page
    if 'exec-io.com$' =~ request.host
      redirect_to 'http://exec.io/charges'
      return false
    end
  end

end
