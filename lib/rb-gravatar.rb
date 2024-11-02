require 'digest/md5'
require 'cgi'
require 'uri'

class Gravatar
  # Construct the Gravatar URI generically with improved validation and HTTPS support
  def self.construct_resource(email_address, size, default)
    # Validate email format
    unless email_address =~ URI::MailTo::EMAIL_REGEXP
      raise ArgumentError, "Invalid email format"
    end

    # Size validation
    size = (1..2048).cover?(size) ? size : 64

    # Build URL
    gravatar_url = "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email_address.downcase.strip)}?s=#{size}"
    gravatar_url += "&d=#{CGI.escape(default)}" if default
    gravatar_url
  end

  # Generate and return only the Gravatar URI
  def self.src(email_address, size = 64, default = nil)
    construct_resource(email_address, size, default)
  rescue ArgumentError => e
    puts "Error: #{e.message}"
    nil
  end

  # Generate and return the full img tag for the Gravatar URI
  def self.tag(email_address, size = 64, default = nil, alt_text = "Gravatar")
    "<img src='#{construct_resource(email_address, size, default)}' class='gravatar' alt='#{CGI.escapeHTML(alt_text)}' />"
  rescue ArgumentError => e
    puts "Error: #{e.message}"
    nil
  end

  # Output the DNS preload tags
  def self.prefetch_dns
    '<link rel="dns-prefetch" href="//gravatar.com">'
  end
end
