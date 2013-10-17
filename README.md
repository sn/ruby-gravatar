rb-gravatar
=============

A simple and up to date Ruby Gem for generating Gravatar images and tags. 

## Installation

```shell
gem install rb-gravatar
````

## Example Usage

```ruby
require 'rb-gravatar'

# Generate only the image URL
puts Gravatar.src('you@you.com')
puts Gravatar.src('you@you.com', 32)
puts Gravatar.src('you@you.com', 32, 'http://you.com/image.png')

# Generate the whole image tag
puts Gravatar.tag('you@you.com')
puts Gravatar.tag('you@you.com', 32)
puts Gravatar.tag('you@you.com', 32, 'http://you.com/image.png', 'The image alt text')
```

# Parameters

```ruby
Gravatar.src(email_address, size, default_image)
```

```ruby
Gravatar.tag(email_address, size, default_image, alt_text)
```

## License

rb-gravatar is available under the MIT license. See the LICENSE file for more info.
