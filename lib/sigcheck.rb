#encoding: utf-8
require 'cgi'
require 'digest/sha1'
require 'base64'
class LiooooUtils
  module SigCheck
    class << self
      #生成URL签名
      #@param string 	method 请求方法 "get" or "post"
      #@param string 	url_path
      #@param array 	params 表单参数
      #@param string 	secret 密钥
      def makeSig(method, url_path, params, secret)
        mk = makeSource(method, url_path, params)
        _secret = secret.tr('-_', '+/')
        my_sign = Digest::HMAC.digest(mk, _secret, Digest::SHA1)
        my_sign = Base64.encode64(my_sign).gsub("\n", "")
        return my_sign
      end

      def makeSource(method, url_path, params)
        _method = method.upcase
        _url_path = CGI.escape(url_path)
        _query_string = params.sort.collect { |v| v.join('=') }.join('&')
        query_string = CGI.escape(_query_string)
        _strs = "#{_method}&#{_url_path}&"
        strs = _strs.gsub('~', '%7E')
        _source_str = "#{strs}#{query_string}".gsub('+', '%20')
        return _source_str
      end

    end

  end
end

#puts LiooooUtils::SigCheck.makeSig('xxx',"/sddd",{},"sdfsdfs");