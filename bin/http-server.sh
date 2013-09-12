#!/bin/sh

exec ruby -S -x $0 "$@"

#! ruby
require 'webrick'

root   = File.expand_path '.'
port   = Integer(ARGV[0]) rescue 8000
server = WEBrick::HTTPServer.new Port: port, DocumentRoot: root
server.start
trap('INT'){ server.shutdown }
