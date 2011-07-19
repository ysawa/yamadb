# initialize the environment for CloudFoundry
# you will have to remove the mongoid.yml file otherwise Mongoid
# will read that file and try to connect, and will error out.
# REF: http://support.cloudfoundry.com/entries/20189436-error-102-optimistic-locking-failure
if ENV['VCAP_SERVICES']
  # get the config from VCAP
  # http://support.cloudfoundry.com/entries/20018322-alert-mongo-bindings-have-changed
  def mongo_connection_info
    services = ActiveSupport::JSON.decode(ENV['VCAP_SERVICES'])
    services.each do |service_version, bindings|
      bindings.each do |binding|
        if binding['label'] =~ /mongo/i
          res = binding['credentials']
          return res
        end
      end
    end

    raise "could not find connection info"
  end

  conn_info = mongo_connection_info

  # configure Mongoid to connect to the db using VCAP connection info
  Mongoid.configure do |config|
    name = conn_info['db'] || 'app'
    host = conn_info['hostname']

    options = {
      "database" => conn_info['db'] || 'app',
      "host"     => conn_info['hostname'],
      "port"     => conn_info['port'].to_i,

      "autocreate_indexes"     => true,
      "allow_dynamic_fields"   => true,
      "include_root_in_json"   => false,
      "parameterize_keys"      => true,
      "persist_in_safe_mode"   => false,
      "raise_not_found_error"  => true,
      "reconnect_time"         => 3
    }

    if conn_info['username'] and conn_info['password']
      options['username'] = conn_info['username']
      options['password'] = conn_info['password']
    end

    config.from_hash(options)
  end
end
