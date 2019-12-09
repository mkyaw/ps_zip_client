#frozen_string_literal: true

require 'httparty'
require 'dotenv'

Dotenv.load('.env')

class Client
  include HTTParty

  default_timeout 5

  attr_reader :zip

  def initialize(zip)
    @zip = zip
  end

  def self.call(zip:)
    new(zip).fetch
  end

  def fetch
    return 'Invalid zip code length' unless zip.to_s.size == 5

    handle_timeouts do
      puts "Fetching populations for zip: #{zip} ..."

      return response.parsed_response if response.success?

      response.response
    end
  end

  def response
    @response ||= HTTParty.get(fetch_url)
  end

  def handle_timeouts
    yield
  rescue Net::OpenTimeout, Net::ReadTimeout
    'Request timed out. Please try again later.'
  rescue StandardError => e
    e.message
  end

  def fetch_url
    "#{ENV['API_URL']}/populations?zip=#{zip}"
    # puts ">>>> ENV['API_URL']: #{ENV['API_URL']}"
    # "https://guarded-waters-44234.herokuapp.com/populations?zip=#{zip}"
  end
end
