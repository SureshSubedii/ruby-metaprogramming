
require 'yaml'
require 'pry'

module Notifications
  CONFIG = YAML.load_file('notifications_config.yml')

  module ClassMethods
    def listens_to(event_name)
      class_name = name.gsub(/([a-z])([A-Z])/, '\1_\2').downcase.gsub('_listener', '')
      method_name = "on_#{class_name}_#{event_name}"


      define_method(method_name) do |data|

        template = CONFIG["notifications"][class_name][event_name.to_s]
        
        message = template.gsub(/%{{{user.name}}}/) do |match|
          data[:user].key?(:name) ? data[:user][:name] : ""
        end
        .gsub(/%{{{post.title}}}/) do |match|
          data[:post].key?(:title) ? data[:post][:title] : ""
        end
        .gsub(/%{{{user.email}}}/) do |match|
          data[:user].key?(:email) ? data[:user][:email] : ""
        end

        message
    end
  end
end

  module InstanceMethods

  end

  def self.included(klass)
    klass.extend(ClassMethods)
    klass.include(InstanceMethods)
  end
end


