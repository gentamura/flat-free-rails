require "flat/free/rails/version"
require_relative '../../../app/helpers/fui-button-helper'


module Flat
  module Free
    module Rails
      class Engine < ::Rails::Engine
        initializer 'flat-free-rails.setup_helpers' do |app|
          ActionController::Base.send :helper, FuiButtonHelper
          FuiButtonHelper.setup
        end
      end
    end
  end
end
