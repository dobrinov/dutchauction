class AuthenticationController < ApplicationController
  before_filter :require_login
end