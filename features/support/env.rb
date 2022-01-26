require 'pry'
require 'rspec'
require 'httparty'
require 'byebug'
require 'faker'
require 'openssl'
require 'json'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

SCHEMA = YAML.load_file('routes/schema.yml')
ENDPOINTS = YAML.load_file('routes/endpoints.yml')
AUTH = YAML.load_file('routes/auth.yml')

page = lambda {|klass| klass.new}

Before do
  @page = page
end