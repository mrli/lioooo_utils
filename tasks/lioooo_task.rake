#encoding: utf-8
require File.expand_path('../../lib/lioooo_utils', __FILE__)

def check_target_dir_ok? target_dir
  return false if target_dir.nil? or target_dir.empty?
  return true
end

namespace :lioooo do
  desc 'link log directory for you project like: my_porject/log -> lioooo/log also default: lioooo_utils/log file'
  task :link_log do
    target_log_dir = ENV['target']
    abort "--> you can't link to root directory not good for you. try agen" if target_log_dir.strip == '/'
    abort '--> you should give me target log directory so that i can link it. try agen' if check_target_dir_ok? target_log_dir
    LiooooLogger.build_log_dir
    cmd = "ln -sf #{LogRoot} #{target_log_dir}"
    ShellExec.exec! cmd
  end
end