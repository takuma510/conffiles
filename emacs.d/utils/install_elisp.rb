#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#
# このスクリプトの守備範囲
# 3rd party elispのwebからのinstall
#

DOT_EMACS_ROOT = '../'
DEFAULT_DIR = 'manual-install/'
ELISP_LIST = {
  'auto-install' => {
    dir: DEFAULT_DIR,
    url: 'http://www.emacswiki.org/emacs/download/auto-install.el'
  }
}

download_command = :curl

def install(dir, url, command, elisp)
  install_dir = "#{DOT_EMACS_ROOT}#{dir}"

  if command == :curl
    system("curl -X GET #{url} > #{install_dir}#{elisp}.el ")
  end
end


ELISP_LIST.each do |elisp, propaty|
  puts "install #{elisp}...to #{propaty[:dir]}"

  if install(propaty[:dir], propaty[:url], download_command, elisp)
    puts "success!!"
  else
    puts "fail"
  end
end
