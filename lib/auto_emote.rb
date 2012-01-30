require 'auto_emote/helpers'
module AutoEmote
  VERSION = '0.0.1'

  class Railtie < ::Rails::Railtie
    initializer 'auto_emote' do |app|
      ActiveSupport.on_load(:action_view) do
        require 'auto_emote/helpers'
      end
    end
  end
end
