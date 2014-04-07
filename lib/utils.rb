#encoding: utf-8
class LiooooUtils
  class << self
    def build_log_dir source, target
      cmd = "ln -sf #{source} #{target}"
      ShellExec.exec! cmd
    end
  end
end