require 'cucumber'
require 'httparty'
require 'pry'
require 'rspec'

Dir[File.join(File.dirname(__FILE__), 'spec_helper/*.rb')].each {|file| require file}

URL = YAML.load_file(File.dirname(__FILE__) + "/config/url.yml")

World(REST)