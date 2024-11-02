# test/test_gravatar.rb

require 'minitest/autorun'
require_relative '../lib/rb-gravatar'

class GravatarTest < Minitest::Test
  def setup
    @email = 'you@you.com'
    @hashed_email = Digest::MD5.hexdigest(@email.downcase.strip)
  end

  def test_construct_resource_with_default_size
    expected_url = "https://www.gravatar.com/avatar/#{@hashed_email}?s=64"
    assert_equal expected_url, Gravatar.construct_resource(@email, 64, nil)
  end

  def test_construct_resource_with_custom_size
    expected_url = "https://www.gravatar.com/avatar/#{@hashed_email}?s=128"
    assert_equal expected_url, Gravatar.construct_resource(@email, 128, nil)
  end

  def test_construct_resource_with_size_out_of_range
    expected_url = "https://www.gravatar.com/avatar/#{@hashed_email}?s=64"
    assert_equal expected_url, Gravatar.construct_resource(@email, 3000, nil) # Exceeds range, should default to 64
  end

  def test_construct_resource_with_default_image
    default_image = 'https://example.com/image.png'
    escaped_image = CGI.escape(default_image)
    expected_url = "https://www.gravatar.com/avatar/#{@hashed_email}?s=64&d=#{escaped_image}"
    assert_equal expected_url, Gravatar.construct_resource(@email, 64, default_image)
  end

  def test_src_method
    expected_url = "https://www.gravatar.com/avatar/#{@hashed_email}?s=64"
    assert_equal expected_url, Gravatar.src(@email)
  end

  def test_src_method_with_custom_size
    expected_url = "https://www.gravatar.com/avatar/#{@hashed_email}?s=128"
    assert_equal expected_url, Gravatar.src(@email, 128)
  end

  def test_src_method_with_default_image
    default_image = 'https://example.com/image.png'
    escaped_image = CGI.escape(default_image)
    expected_url = "https://www.gravatar.com/avatar/#{@hashed_email}?s=64&d=#{escaped_image}"
    assert_equal expected_url, Gravatar.src(@email, 64, default_image)
  end

  def test_tag_method
    expected_tag = "<img src='https://www.gravatar.com/avatar/#{@hashed_email}?s=64' class='gravatar' alt='Gravatar' />"
    assert_equal expected_tag, Gravatar.tag(@email)
  end

  def test_tag_method_with_custom_size_and_alt_text
    alt_text = 'User avatar'
    expected_tag = "<img src='https://www.gravatar.com/avatar/#{@hashed_email}?s=128' class='gravatar' alt='User avatar' />"
    assert_equal expected_tag, Gravatar.tag(@email, 128, nil, alt_text)
  end

  def test_tag_method_with_default_image
    default_image = 'https://example.com/image.png'
    alt_text = 'User avatar'
    escaped_image = CGI.escape(default_image)
    expected_tag = "<img src='https://www.gravatar.com/avatar/#{@hashed_email}?s=64&d=#{escaped_image}' class='gravatar' alt='User avatar' />"
    assert_equal expected_tag, Gravatar.tag(@email, 64, default_image, alt_text)
  end

  def test_prefetch_dns
    expected_link = '<link rel="dns-prefetch" href="//gravatar.com">'
    assert_equal expected_link, Gravatar.prefetch_dns
  end

  def test_invalid_email
    invalid_email = 'invalid_email'
    assert_raises(ArgumentError) { Gravatar.construct_resource(invalid_email, 64, nil) }
  end
end
