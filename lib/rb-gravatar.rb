require 'digest/md5'
require 'cgi'

class Gravatar
  # Construct the Gravatar URI generically
  def self.construct_resource(email_address, size, default)
    if size < 1 || size > 2048
      size = 64
    end
    
    parts = []
    parts << "//www.gravatar.com/avatar/"
    parts << "#{Digest::MD5.hexdigest(email_address.downcase.strip)}"
    parts << "?s=#{size}"
    
    if !default.nil?
      parts << "&d=#{CGI.escape(default)}"
    end
    
    parts.join        
  end
  
  # Generate and return only the Gravatar URI
  def self.src(email_address, size = 64, default = nil)
    begin
      Gravatar.construct_resource(email_address, size, default)
    rescue Exception => e
      nil
    end
  end

  # Generate and return the full img tag for the Gravatar URI
  def self.tag(email_address, size = 64, default = nil, alt_text = nil)    
    begin
      return "<img src='#{Gravatar.construct_resource(email_address, size, default)}' class='gravatar' alt='#{alt_text}' />"
    rescue Exception => e
      nil
    end
  end  
  
  # Output the DNS preload tags
  def self.prefetch_dns()
    '<link rel="dns-prefetch" href="//gravatar.com">'
  end
end