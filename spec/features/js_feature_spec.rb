require 'rails_helper'

RSpec.feature 'test that we can use JS in feature tests', js: true do
  describe 'going to a page and running some JS' do
    it 'runs some JS' do
      visit('/')
      execute_script('document.write("THIS IS SOME JS!!!")')
      expect(page).to have_content('THIS IS SOME JS!!!')
    end
  end
end
