#encoding: utf-8
require 'colored'
require 'logging'
require 'benchmark'
require File.expand_path('../time_utils', __FILE__)
LogRoot = File.expand_path('../../log', __FILE__)
class LiooooUtilsLogger
  attr_accessor :logger, :log_dir

  def initialize(type, log_dir=nil)
    @log_dir = log_dir.nil? ? LogRoot : log_dir
    init_log_dir
    path = File.expand_path("#{log_dir}/#{type}_log.log", __FILE__)
    @logger = Logging.logger["Lioooo#{type.upcase}Log"]
    @logger.add_appenders(
        Logging.appenders.stdout,
        Logging.appenders.file(path)
    )
    logger.level = :debug
  end

  def prefix(fix)
    path = File.expand_path("#{LogRoot}/#{fix}_log.log", __FILE__)
    @logger.add_appenders(
        Logging.appenders.stdout,
        Logging.appenders.file(path)
    )
  end

  # liooo_link_log_dir require log directory
  def init_log_dir
    cmd = "mkdir -p #{log_dir}"
    system cmd unless File.exist? log_dir
  end

  # puts log with error prefix
  def error(msg)
    msg = "[#{now}] #{msg}"
    @logger.error msg.red
  end

  def now
    LiooooUtils::TimeUtils.now_y_m_d_s_m_s
  end

  # puts log with info prefix
  def info(msg)
    msg = "[#{now}] #{msg}"
    @logger.info msg
  end

  def warn(msg)
    msg = "[#{now}] #{msg}"
    @logger.warn msg.magenta
  end

  def debug msg
    msg = "[#{now}] #{msg}"
    @logger.debug msg.yellow
  end

  def shell(msg)
    msg = "\n [#{now}] #{msg}"
    @logger.debug msg.white_on_black
  end

  # formate log timestamp
  def split
    msg = Time.now.strftime("%Y-%m-%d [ %H:%M:%S ]").to_s.center 100, '-'
    @logger.info msg.blue
  end

  #---------------------for call shell command----------------
  def shell_exec!(cmd)
    shell cmd
    system "source ~/.bash_profile && #{cmd}"
  end

  # print block exec time
  def real_time(&block)
    if block_given?
      elapsed = Benchmark.realtime do
        yield
      end
      warn "执行完毕: #{(elapsed).round(2)} 秒!"
    end
  end


end

# need init when use it
#LiooooLogger = LiooooUtilsLogger.new :lioooo, "/tmp"
#LiooooLogger.real_time do |ele|
#  sleep 3
#end








