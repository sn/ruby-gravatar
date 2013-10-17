require 'digest/md5'
require 'erb'

class Gravatar
  include ERB::Util
  
  def self.construct_resource(email_address, size, default)
    if size < 1 || size > 2048
      size = 64
    end
    parts = []
    parts << "http://www.gravatar.com/avatar/"
    parts << "#{Digest::MD5.hexdigest(email_address.downcase.strip)}"
    parts << "?s=#{size}"
    
    if !default.nil?
      parts << "&d=#{url_encode(default)}"
    end
    
    parts.join        
  end
  
  def self.src(email_address, size = 64, default = nil)
    Gravatar.construct_resource(email_address, size, default)
  end

  def self.tag(email_address, size = 64, default = nil, alt_text = nil)    
    return "<img src='#{Gravatar.construct_resource(email_address, size, default)}' />" if alt_text.nil?
    return "<img src='#{Gravatar.construct_resource(email_address, size, default)}' alt='#{alt_text}' />" if !alt_text.nil?
  end  
end