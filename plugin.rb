# name: jitsi
# about:
# version: 0.1
# authors: tmtran11
# url: https://github.com/tmtran11


register_asset "stylesheets/common/jitsi.scss"


enabled_site_setting :jitsi_enabled

PLUGIN_NAME ||= "jitsi".freeze

after_initialize do
  
  # see lib/plugin/instance.rb for the methods available in this context
  

  module ::Jitsi
    class Engine < ::Rails::Engine
      engine_name PLUGIN_NAME
      isolate_namespace Jitsi
    end
  end

  

  
  require_dependency "application_controller"
  class jitsi::ActionsController < ::ApplicationController
    requires_plugin PLUGIN_NAME

    before_action :ensure_logged_in

    def list
      render json: success_json
    end
  end

  jitsi::Engine.routes.draw do
    get "/list" => "actions#list"
  end

  Discourse::Application.routes.append do
    mount ::jitsi::Engine, at: "/jitsi"
  end
  
end
