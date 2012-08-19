#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#
# このスクリプトの守備範囲
# 3rd party elispのwebからのinstall
#

DOT_EMACS_ROOT = '../'
DEFAULT_DIR = 'manual-install/'
ELISP_LIST = {
  'init-loader' => { 
    dir: DEFAULT_DIR, 
    url: 'http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el'
  },

  'auto-install' => {
    dir: DEFAULT_DIR,
    url: 'http://www.emacswiki.org/emacs/auto-install.el'
  }
}

download_command = :curl

def install(dir, url, command, elisp)
  if command == :curl
    system("curl -o #{DOT_EMACS_ROOT}#{dir}#{elisp}.el #{url}")
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
