require "spec_helper"

describe Devise::SessionsController do
  before do
    Yamadb::SYSTEM['protocol'] = { 'default' => 'http', 'secure' => 'https' }
  end
  describe "routing" do
    it "routes to #new" do
      get(new_user_session_url(:host => 'test', :protocol => 'https')).should route_to("devise/sessions#new")
    end
  end
end
