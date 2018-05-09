require 'rails_helper'

describe Hyrax::FileSetsController do
  xit "should return a 403 if no credentials are provided" do
    expect(response).to have_http_status 403
    patch :udpate
  end
end
