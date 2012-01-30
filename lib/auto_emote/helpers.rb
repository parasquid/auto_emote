module AutoEmote
  module ::ActionView
    module Helpers
      module TextHelper

        AUTO_EMOTE_EMOTICONS = {
          ':)' => 'happy',
          ':(' => 'sad' ,
          ';)' => 'winking'
        }
        
        def auto_emote(text, options={}, &block)
          return ''.html_safe if text.blank?

          sanitize = (options[:sanitize] != false)        
          text = conditional_sanitize(text, sanitize).to_str
          
          AUTO_EMOTE_EMOTICONS.keys.each do |emoticon|
            puts emoticon
            s = Regexp.escape(emoticon)
            text.gsub!(/#{s}/, image_tag(File.join('auto_emote', AUTO_EMOTE_EMOTICONS[emoticon] + '.gif')))
          end
          text
        end

        private
        
        def conditional_sanitize(target, condition)
          condition ? sanitize(target) : target
        end

      end
    end
  end
end
