require "flat/free/rails/version"
require_relative '../../../app/helpers/fui-button-helper'
require_relative '../../../app/helpers/fui-form-helper'
require_relative '../../../app/helpers/fui-icon-helper'
require_relative '../../../app/helpers/fui-illust-icon-helper'
require_relative '../../../app/helpers/fui-tile-helper'

module Flat
  module Free
    module Rails
      class Engine < ::Rails::Engine
        initializer 'flat-free-rails.setup_helpers' do |app|
          ActionController::Base.send :helper, FuiButtonHelper
          FuiButtonHelper.setup
          ActionController::Base.send :helper, FuiFormHelper
          FuiFormHelper.setup
          ActionController::Base.send :helper, FuiIconHelper
          FuiIconHelper.setup
          ActionController::Base.send :helper, FuiIllustIconHelper
          FuiIllustIconHelper.setup
          ActionController::Base.send :helper, FuiTileHelper
        end
      end
    end
  end
end
