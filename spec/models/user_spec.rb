require 'spec_helper'

describe User do
  describe 'fabrication' do
    it 'success' do
      user = Fabricate(:user)
      user.persisted?.should be_true
    end
  end

  describe 'validate' do
    before do
      @user = Fabricate(:user, :name => 'user', :email => 'user@example.com')
    end

    it 'name correctly' do
      user = Fabricate.build(:user, :name => '')
      user.valid?
      user.errors[:name].should include I18n.t('activemodel.errors.messages.blank')
      user = Fabricate.build(:user, :name => 'user')
      user.valid?
      user.errors[:name].should include I18n.t('activemodel.errors.messages.taken')
      user = Fabricate.build(:user, :name => 'user+')
      user.valid?
      user.errors[:name].should include I18n.t('activemodel.errors.messages.invalid')
    end

    it 'email correctly' do
      user = Fabricate.build(:user, :email => 'user@example.com')
      user.valid?
      user.errors[:email].should include I18n.t('activemodel.errors.messages.taken')
    end
  end
end
