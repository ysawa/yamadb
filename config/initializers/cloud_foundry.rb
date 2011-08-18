# initialize the environment for CloudFoundry
module Yamadb
  def cloud_foundry?
    !!ENV['VCAP_SERVICES']
  end
  module_function :cloud_foundry?
end

# monkey patch to check if using https protocol
if Yamadb.cloud_foundry?
  class ActionDispatch::Request
    def ssl?
      @env['HTTP_SSLCLIENTCIPHER'].present?
    end
  end

  module SslRequirement
  private
    def ensure_proper_protocol
      return true if SslRequirement.disable_ssl_check?

      if ssl_required? && !request.ssl?
        redirect_to determine_redirect_url(request, true), :status => (redirect_status || :found)
        flash.keep
        return false
      else
        return true
      end
    end
  end
end
