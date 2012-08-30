# Run with: rackup private_pub.ru -s thin -E production
require "rubygems"
require "bundler/setup"
require "yaml"
require "faye"
require "thin"
require "private_pub"

PrivatePub.load_config(File.expand_path("../config/private_pub.yml", __FILE__), ENV["RAILS_ENV"] || "development")
run PrivatePub.faye_app
Faye::WebSocket.load_adapter('thin')
