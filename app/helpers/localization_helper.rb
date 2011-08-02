module LocalizationHelper
  %w(button notice operation question).each do |scope|
    module_eval <<-EOS
      def translate_#{scope}(sentence, options = {})
        translate_english_sentence('#{scope}', sentence, options)
      end
    EOS
  end

  def translate_english_sentence(scope, sentence, options = {})
    key = sentence.gsub(/\W/, '_').tr("A-Z", 'a-z')
    result = I18n.t("#{scope.pluralize}.#{key}", options)
    if result =~ /^translation missing/
      sentence
    else
      result
    end
  end
end
