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
  },
  'tabbar' => {
    dir: DEFAULT_DIR,
    url: 'http://www.emacswiki.org/emacs/download/tabbar.el'
  },
  'auto-save-buffers' => {
    dir: DEFAULT_DIR,
    url: 'http://0xcc.net/misc/auto-save/auto-save-buffers.el'
  }
}

download_command = :curl

def install(dir, url, command, elisp)
  install_dir = "#{DOT_EMACS_ROOT}#{dir}"

  if command == :curl
    system("curl -X GET #{url} > #{install_dir}#{elisp}.el ")
  end
end

def is_installed(elisp, dir)
  file_path = DOT_EMACS_ROOT + dir + elisp + '.el'
  File.exists?("#{file_path}")
end

ELISP_LIST.each do |elisp, propaty|
  next if is_installed(elisp, propaty[:dir])

  puts "install #{elisp}...to #{propaty[:dir]}"
  if install(propaty[:dir], propaty[:url], download_command, elisp)
    puts "success!!"
  else
    puts "fail"
  end
end
