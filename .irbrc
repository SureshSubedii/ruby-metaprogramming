require_relative 'notifications'
Dir["./listeners/*.rb"].each {|file| require file }
