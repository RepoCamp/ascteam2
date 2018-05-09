class ApplicationController < ActionController::Base
  helper Openseadragon::OpenseadragonHelper
  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  skip_after_action :discard_flash_if_xhr
  include Hydra::Controller::ControllerBehavior

  # Adds Hyrax behaviors into the application controller
  include Hyrax::Controller
  include Hyrax::ThemedLayoutController
  with_themed_layout '1_column'

  before_action :check_auth_with_http_basic, if: :http_auth_header?

  # protect_from_forgery with: :exception, unless: :http_auth_header?
  # protect_from_forgery with: :null_session, if: :http_auth_header?
  # protect_from_forgery with: :null_session

  def check_auth_with_http_basic
    authenticate_or_request_with_http_basic do |username,password|
      resource = User.find_by_email(username)
      if resource.valid_password?(password)
        sign_in :user, resource
      end
    end
  end

  def http_auth_header?
    request.headers["HTTP_AUTHORIZATION"].present?
  end
end
