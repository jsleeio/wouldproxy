#!/usr/bin/env ruby

require 'net/http'

ARGV.each do |u|
  uri = URI(u)
  h = Net::HTTP.new(uri.host, uri.port)
  if h.proxy?
    puts "would use '#{h.proxy_address}:#{h.proxy_port}' for '#{u}'"
  else
    puts "would not use proxy for '#{u}'"
  end
end

