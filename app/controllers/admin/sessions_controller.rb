# -*- encoding : utf-8 -*-
class Admin::SessionsController < ::Devise::SessionsController
  layout "admin"
  # the rest is inherited, so it should work
end
