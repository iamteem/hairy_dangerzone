# HairyDangerzone

Some demo thing.

## Installation

Add this line to your application's Gemfile:

    gem 'hairy_dangerzone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hairy_dangerzone

## Usage

```ruby
class MyClass
  include HairyDangerzone::Awesome

  danger_danger :x, "Not a string" do |attr|
    attr.is_a?(String)
  end
end

i = MyClass.new
i.x = "ok"
i.x = 1 #=> should raise "Invalid String"

i.hairy_dangerzone_x?(1) #=> false
i.hairy_dangerzone_x?("Hello") #=> true
```

## Contributing

1. Fork it ( http://github.com/iamteem/hairy_dangerzone/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
