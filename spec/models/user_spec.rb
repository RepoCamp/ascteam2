require 'rails_helper'

RSpec.describe User do
  let(:user) { described_class.new(email: 'someone@somewhere.com', password: 'adminadmin') }

  it 'returns the email for to_s' do
    expect(user.to_s).to eq('someone@somewhere.com')
  end

  it 'returns the email when sent the email message' do
    expect(user.email).to eq('someone@somewhere.com')
  end
end
