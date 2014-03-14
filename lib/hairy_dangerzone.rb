require "hairy_dangerzone/version"

module HairyDangerzone
  module Awesome
    def self.included(klass)
      klass.extend(ClassMethods)
    end

    module ClassMethods
      def danger_danger(attribute, fail_message, &block)
        self.instance_eval do
          define_method :"#{attribute}_with_danger_danger=" do |new_value|
            if block.call(new_value)
              send(:"#{attribute}_without_danger_danger=", new_value)
            else
              fail fail_message
            end
          end

          alias_method :"#{attribute}_without_danger_danger=", :"#{attribute}="
          alias_method :"#{attribute}=", :"#{attribute}_with_danger_danger="
        end
      end
    end
  end
end

