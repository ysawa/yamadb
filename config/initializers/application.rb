module Yamadb
  LOCALES = [:ja, :en]
  SYSTEM = YAML.load_file(File.join(Rails.root, 'config/system.yml'))
  module Mailer
    @@mailer = ::Yamadb::SYSTEM['mailer']

    # define functions to get mailer configurations
    function_names = %w(default_email default_url_options delivery_method sendmail_settings smtp_settings)
    function_names.each do |function_name|
      module_eval(<<-EOS)
        def #{function_name}
          @@mailer['#{function_name}']
        end
      EOS
    end
    module_function *function_names
  end
end
