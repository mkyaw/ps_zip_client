#frozen_string_literal: true

require './client'
puts Client.call(zip: ARGV[0] || 90245)