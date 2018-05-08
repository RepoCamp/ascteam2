require 'rails_helper'
include Warden::Test::Helpers

RSpec.feature 'Sidekiq Web UI' do
  let(:user) { User.new(email: 'non-admin@example.com', password: 'password') }
  let(:admin_user) { User.new(email: 'admin@example.com', password: 'password') }
  let(:admin_role) { Role.create(name: "admin") }

  before do
    admin_role.users << admin_user
    admin_role.save
    admin_user.save
  end

  describe 'going to the web ui for Sidekiq' do
    it 'is vistable' do
      login_as admin_user
      visit('/jobs')
      expect(page).to have_content('Sidekiq')
    end
  end
end
