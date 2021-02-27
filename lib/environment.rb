# frozen_string_literal: true
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'json'

require_relative "UpcomingSnkrReleases/version"
require_relative './UpcomingSnkrReleases/Snkr.rb'
require_relative './UpcomingSnkrReleases/Get_API_Data.rb'
require_relative './UpcomingSnkrReleases/CLI.rb'

module UpcomingSnkrReleases
  class Error < StandardError; end
  # Your code goes here...
end
