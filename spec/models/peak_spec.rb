require 'spec_helper'

describe Peak do
  describe 'fabrication' do
    it 'success' do
      peak = Fabricate(:peak)
      peak.persisted?.should be_true
    end
  end

  describe 'validate' do
    before do
      @peak = Fabricate(:peak, :name => '槍ヶ岳')
    end

    it 'name correctly' do
      peak = Fabricate.build(:peak, :name => '')
      peak.valid?
      peak.errors[:name].should include I18n.t('activemodel.errors.messages.blank')
    end
  end
end
