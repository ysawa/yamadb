module FakeWebHelper
  def fake_search_twitter
    file = File.open(File.join(Rails.root, 'spec/support/fake_web/search_twitter.json'))
    FakeWeb.register_uri(:get, %r|https:\/\/search\.twitter\.com\/search\.json|, :body => file.read)
    file.close
    nil
  end

  def fake_wunderground_forecast
    file = File.open(File.join(Rails.root, 'spec/support/fake_web/wunderground_forecast.xml'))
    FakeWeb.register_uri(:get, Regexp.new(Wunderground::FORECAST_XML.gsub('.', '\.').gsub('/', '\/')), :body => file.read)
    file.close
    nil
  end
end
