## Simply Ruby Gem to generate Gravatar tags
A simple and up-to-date Ruby gem for generating Gravatar image URLs and HTML tags. Easily add Gravatar support to your Ruby or Rails applications with this lightweight library. 

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://buymeacoffee.com/underwulf)

Installation
-----------------
To install the `rb-gravatar` gem, run:

```shell
gem install rb-gravatar
```

Or add it to your Gemfile:
```ruby
gem 'rb-gravatar'
```

Then run:
```bash
bundle install
```

### Usage

#### Basic Usage

**Generate Only the Gravatar Image URL:**

The `Gravatar.src` method returns the Gravatar URL for a given email, size, and optional default image.

```ruby
require 'rb-gravatar'

# Basic Gravatar URL
puts Gravatar.src('you@you.com')
# => https://www.gravatar.com/avatar/d7f390bdf9f44bd8f460ac1aff05a603?s=64

# With custom size
puts Gravatar.src('you@you.com', 32)
# => https://www.gravatar.com/avatar/d7f390bdf9f44bd8f460ac1aff05a603?s=32

# With custom size and default image URL
puts Gravatar.src('you@you.com', 32, 'https://example.com/image.png')
# => https://www.gravatar.com/avatar/d7f390bdf9f44bd8f460ac1aff05a603?s=32&d=https%3A%2F%2Fexample.com%2Fimage.png
```

**Generate the Gravatar Image Tag:**

The `Gravatar.tag` method returns a complete HTML `<img>` tag for embedding the Gravatar image in a web page, including optional `alt` text.

```ruby
# Basic image tag
puts Gravatar.tag('you@you.com')
# => <img src='https://www.gravatar.com/avatar/d7f390bdf9f44bd8f460ac1aff05a603?s=64' class='gravatar' alt='' />

# With custom size and alt text
puts Gravatar.tag('you@you.com', 32, 'https://example.com/image.png', 'User avatar')
# => <img src='https://www.gravatar.com/avatar/d7f390bdf9f44bd8f460ac1aff05a603?s=32&d=https%3A%2F%2Fexample.com%2Fimage.png' class='gravatar' alt='User avatar' />
```

### Using with Rails
When using `Gravatar.tag` in Rails views, Rails escapes HTML by default. To render the HTML tag unescaped, wrap it in the Rails `raw` helper:

```erb
<%= raw Gravatar.tag('you@you.com', 64, nil, 'Profile Picture') %>
```

#### Parameters

- `Gravatar.src(email_address, size = 64, default_image_url = nil)`: Generates the Gravatar image URL.
  - `email_address`: The email address used to generate the Gravatar.
  - `size`: The desired image size (between 1 and 2048 pixels).
  - `default_image_url`: The URL of the default image to show if the user has no Gravatar.
- `Gravatar.tag(email_address, size = 64, default_image_url = nil, alt_text = '')`: Generates the complete HTML `<img>` tag.
  - `email_address`: The email address used to generate the Gravatar.
  - `size`: The desired image size.
  - `default_image_url`: URL of the default image.
  - `alt_text`: Alternative text for the image.

#### DNS Prefetch

For faster image loading, add a DNS prefetch tag to your page headers:

```erb
<%= Gravatar.prefetch_dns %>
```

This inserts:
```html
<link rel="dns-prefetch" href="//gravatar.com">
```

License
-----------------
Please see [LICENSE](https://github.com/sn/ruby-gravatar/blob/master/LICENSE) for licensing details.

Author
-----------------
[github.com/sn](https://github.com/sn) 
