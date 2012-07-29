# YamlConverters

Convert YAML to segments and back.

## Installation

Add this line to your application's Gemfile:

    gem 'yaml_converters'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yaml_converters

## Usage

Use `YamlConverters::YamlToSegmentsConverter#convert` to split YAML file
into flat key-value pairs.

You can pass custom `segment_writer` to dump generated segments
somewhere (database, for example). Custom writer should respond to
two public methods:

* `write(key, value)` - performs actual key-value pair dumping
* `result` - returns whatever you want from `convert`

Default `segment_writer` is an instance of
`YamlConverters::SegmentToHashWriter` that returns a `Hash`.

``` ruby
module YamlConverters
  class SegmentToHashWriter
    attr_reader :result

    def initialize
      @result = {}
    end

    def write(key, value)
      @result.deep_merge!({ key => value })
    end
  end
end
```

Use `YamlConverters::SegmentsToYamlConverter#convert` to dump segments
(key-value pairs) to YAML file.

You can pass custom `yaml_writer` to dump generated YAML file
somewhere (file, for example). Custom writer should respond to
two public methods:

* `write(yaml_string)` - performs actual YAML string dumping
* `result` - returns whatever you want from `convert`

Default `yaml_writer` is an instance of
`YamlConverters::YamlToStringWriter` that returns a `String`.

``` ruby
module YamlConverters
  class YamlToStringWriter
    attr_reader :result

    def initialize
      @result = ''
    end

    def write(yaml)
      @result = yaml
    end
  end
end
```

## Acknowledgements

Implementation of flattening a YAML file and generating a YAML file
from key-value pairs taken (I hope, for now) from Tolk codebase.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
