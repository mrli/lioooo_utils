#encoding: utf-8
class LiooooUtils
  module TimeUtils
    class << self

      #print strftime 2014-04-28 13:24:46
      def now_y_m_d_s_m_s
        Time.now.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end
end

#puts LiooooUtils::TimeUtils.now_y_m_d_s_m_s