# REF: http://support.cloudfoundry.com/entries/20189436-error-102-optimistic-locking-failure
# you will have to remove the mongoid.yml file otherwise Mongoid
# will read that file and try to connect, and will error out.
if Yamadb.cloud_foundry?
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

      "autocreate_indexes"     => false,
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
module Mongoid
  module MultiParameterAttributes
  protected
    def instantiate_object(klass, values_with_empty_parameters)
      return nil if values_with_empty_parameters.all? { |v| v.nil? }
      values = values_with_empty_parameters.collect { |v| v.nil? ? 1 : v }
      if klass == DateTime || klass == Time
        return nil if values.size < 4
        return nil if values.first < 1900
        klass.send(:convert_to_time, values)
      elsif klass == Date
        return nil if values.size < 3
        return nil if values.first < 1900
        klass.send(:convert_to_time, values)
      elsif klass
        klass.new *values
      else
        values
      end
    end
  end
end
class << Integer
  def set(integer)
    case integer
    when nil, ""
      nil
    when String
      integer.tr("０-９", '0-9').gsub(/[^^]-/, "").gsub(/[^-0-9]/, "").to_i
    else
      integer.to_i
    end
  end
end

load File.join(Rails.root,'Rakefile')
Rake::Task['db:mongoid:create_indexes'].invoke
