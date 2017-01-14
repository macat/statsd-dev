#!/usr/bin/env ruby
# http://lee.hambley.name/2013/01/26/dirt-simple-statsd-server-for-local-development.html

require 'socket'
require 'term/ansicolor'

include Term::ANSIColor

$stdout.sync = true

c = Term::ANSIColor
s = UDPSocket.new
port = ENV.fetch('PORT', 8125)
s.bind('0.0.0.0', port)

puts "Statsd Dev Server Started on port #{ port }"

while blob = s.recvfrom(1024)
  metric, value = blob.first.split(':')
  puts "StatsD Metric: #{c.blue(metric)} #{c.green(value)}"
end
