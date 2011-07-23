module LocalizationHelper
  %w(button operation question).each do |scope|
    module_eval <<-EOS
      def translate_#{scope}(sentence)
        translate_english_sentence('#{scope}', sentence)
      end
    EOS
  end

  def translate_english_sentence(scope, sentence)
    key = sentence.gsub(/\W/, '_').tr("A-Z", 'a-z')
    result = I18n.t("#{scope.pluralize}.#{key}")
    if result =~ /^translation missing/
      sentence
    else
      result
    end
  end
end
