# initialize the environment for CloudFoundry
module Yamadb
  def cloud_foundry?
    !!ENV['VCAP_SERVICES']
  end
  module_function :cloud_foundry?
end
